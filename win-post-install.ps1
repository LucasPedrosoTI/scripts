#Install WinGet
#Based on this gist: https://gist.github.com/crutkas/6c2096eae387e544bd05cde246f23901
$hasPackageManager = Get-AppPackage -name 'Microsoft.DesktopAppInstaller'
if (!$hasPackageManager -or [version]$hasPackageManager.Version -lt [version]"1.10.0.0") {
    "Installing winget Dependencies"
    Add-AppxPackage -Path 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'

    $releases_url = 'https://api.github.com/repos/microsoft/winget-cli/releases/latest'

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $releases = Invoke-RestMethod -uri $releases_url
    $latestRelease = $releases.assets | Where { $_.browser_download_url.EndsWith('msixbundle') } | Select -First 1

    "Installing winget from $($latestRelease.browser_download_url)"
    Add-AppxPackage -Path $latestRelease.browser_download_url
}
else {
    "winget already installed"
}

#winget config path from: https://github.com/microsoft/winget-cli/blob/master/doc/Settings.md#file-location
$settingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json";
$settingsJson = 
@"
    {
        // For documentation on these settings, see: https://aka.ms/winget-settings
        "experimentalFeatures": {
          "experimentalMSStore": true,
        }
    }
"@;
$settingsJson | Out-File $settingsPath -Encoding utf8

#Install New apps
Write-Output "Installing Apps"
$apps = @( 
    @{name = "JetBrains.IntelliJIDEA.Community"}, 
    @{name = "CoreyButler.NVMforWindows"},
    @{name = "Git.Git" }, 
    @{name = "Oracle.MySQL" },
    @{name = "Google.Chrome" },
    @{name = "SlackTechnologies.Slack" },
    @{name = "Microsoft.Teams" },
    @{name = "Adobe.Acrobat.Reader.64-bit" },
    @{name = "Zoom.Zoom" },
    @{name = "RARLab.WinRAR" },
    @{name = "Oracle.VirtualBox" },
    @{name = "Azul.Zulu.24.JDK" },
    @{name = "Python.Python.3.12"},
    @{name = "Microsoft.WindowsTerminal"; source = "msstore" }, 
    @{name = "9PKTQ5699M62"; source = "msstore" }, # icloud
    @{name = "9NKSQGP7F2NH"; source = "msstore" }, # whatsapp
    @{name = "JanDeDobbeleer.OhMyPosh" },
    @{name = "Microsoft.PowerToys" } 
);
Foreach ($app in $apps) {
    $listApp = winget list -e -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing:" $app.name
        if ($null -ne $app.source) {
            winget install -e -h $app.name -s $app.source
        }
        else {
            winget install -e -h $app.name 
        }
    }
    else {
        Write-host "Skipping Install of " $app.name
    }
}

winget install Microsoft.VisualStudioCode --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,desktopicon,addtopath,associatewithfiles"'

#Install NodeJS
Write-Output "Installing NodeJS..."
nvm install lts
nvm use lts
node -v

#Remove Apps
Write-Output "Removing Apps"

$apps = "*3DPrint*", "Microsoft.MixedReality.Portal"
Foreach ($app in $apps)
{
  Write-host "Uninstalling:" $app
  Get-AppxPackage -allusers $app | Remove-AppxPackage
}

# configuring windows terminal
Write-Output "Configuring oh my posh"

Install-PackageProvider -Name NuGet -Confirm:$false
Install-Module posh-git -Scope CurrentUser -Force

$OhMyPoshConfig = "`noh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/jandedobbeleer.omp.json | Invoke-Expression`nImport-Module posh-git"
Add-Content $PROFILE $OhMyPoshConfig
# install firacode font: oh-my-posh font install FiraCode

#Installing chocolatey
Write-Output "Installing chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install firacode -fy