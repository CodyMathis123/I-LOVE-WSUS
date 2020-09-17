function Invoke-ILWSUSConfigSSL {
    $FQDN = [SYSTEM.NET.DNS]::GetHostByName($env:COMPUTERNAME).hostname
    Start-Process -FilePath "c:\Program Files\Update Services\tools\WsusUtil.exe" -ArgumentList 'configuressl', $FQDN -NoNewWindow -Wait
}