function Test-ILWSUSIsSSL {
    [bool]$UsingSSL = (Get-ItemProperty -Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Update Services\Server\Setup' -Name 'UsingSSL' -ErrorAction SilentlyContinue).UsingSSL
    return $UsingSSL
}