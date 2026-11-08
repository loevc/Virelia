Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue

try {
    Get-ChildItem "$env:LOCALAPPDATA\Microsoft\Windows\Explorer" -Filter "iconcache*.db" -File |
        Remove-Item -Force -ErrorAction Continue

    Remove-Item "$env:LOCALAPPDATA\IconCache.db" -Force -ErrorAction SilentlyContinue
}
finally {
    Start-Process explorer.exe
}

# powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Users\loevc\Documents\iconcache.ps1"


