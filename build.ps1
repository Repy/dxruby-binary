$ErrorActionPreference = "Stop"

Invoke-WebRequest "https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe" -OutFile ".\directx_Jun2010_redist.exe"
Start-Process -Wait -FilePath ".\directx_Jun2010_redist.exe" -ArgumentList "/silent"

Start-Process -NoNewWindow -Wait -FilePath "git.exe" -ArgumentList "clone", "https://github.com/mirichi/dxruby.git"

function Build-DXRuby($url, $installpath, $ver) {
    Invoke-WebRequest "$url" -OutFile ".\rubyinstaller.exe"
    Start-Process -Wait -FilePath ".\rubyinstaller.exe" -ArgumentList "/silent", "/currentuser"
    Remove-Item ".\rubyinstaller.exe"
    . "$installpath\bin\ridk.ps1" "enable"
    Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby\ext\dxruby" -FilePath "ruby.exe" -ArgumentList "extconf.rb"
    Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby\ext\dxruby" -FilePath "make.exe" -ArgumentList "CCDLFLAGS="" -fpermissive """
    New-Item -ItemType Directory ".\dxruby\lib\$ver"
    Move-Item ".\dxruby\ext\dxruby\dxruby.so" ".\dxruby\lib\$ver\dxruby.so"
    Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby\ext\dxruby" -FilePath "make.exe" -ArgumentList "clean"
}

Build-DXRuby "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.1.6-1/rubyinstaller-devkit-3.1.6-1-x86.exe" "C:\Ruby31" "3.1" 
Build-DXRuby "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.2.6-1/rubyinstaller-devkit-3.2.6-1-x86.exe" "C:\Ruby32" "3.2" 
Build-DXRuby "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.3.6-2/rubyinstaller-devkit-3.3.6-2-x86.exe" "C:\Ruby33" "3.3" 
Build-DXRuby "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.4.1-1/rubyinstaller-devkit-3.4.1-1-x86.exe" "C:\Ruby34" "3.4"

Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby" -FilePath "git.exe" -ArgumentList "config", "--global", "user.email", "you@example.com"
Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby" -FilePath "git.exe" -ArgumentList "config", "--global", "user.name", "Your Name"
Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby" -FilePath "git.exe" -ArgumentList "add", "lib\*\*.so"
Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby" -FilePath "git.exe" -ArgumentList "commit", "-m", "tmp"  
Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby" -FilePath "gem.cmd" -ArgumentList "build", ".\dxruby.gemspec"
