
function Build-DXRuby($url, $installpath, $ver) {
    Invoke-WebRequest "$url" -OutFile ".\rubyinstaller.exe"
    Start-Process -Wait -FilePath ".\rubyinstaller.exe" -ArgumentList "/silent", "/currentuser"
    Remove-Item ".\rubyinstaller.exe"
    Start-Process -NoNewWindow -Wait -FilePath "git.exe" -ArgumentList "clone", "https://github.com/mirichi/dxruby.git"
    Start-Process -NoNewWindow -Wait -FilePath "$installpath\bin\ridk.ps1" -ArgumentList "enable"
    Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby\ext\dxruby" -FilePath "ruby.exe" -ArgumentList "extconf.rb"
    Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby\ext\dxruby" -FilePath "make.exe"
    New-Item -ItemType Directory ".\$ver"
    Move-Item ".\dxruby\ext\dxruby\dxruby.so" ".\$ver\dxruby.so"
    Start-Process -NoNewWindow -Wait -WorkingDirectory ".\dxruby\ext\dxruby" -FilePath "make.exe" "clean"
}

Build-DXRuby "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.3.6-2/rubyinstaller-devkit-3.3.6-2-x86.exe", "C:\Ruby33", "3.3" 
Build-DXRuby "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.4.1-1/rubyinstaller-devkit-3.4.1-1-x86.exe", "C:\Ruby34", "3.4"
