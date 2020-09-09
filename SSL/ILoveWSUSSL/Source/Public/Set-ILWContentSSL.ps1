function Set-ILWContentSSL {
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = 'Disabled'
        WSUSComponent = [WSUSComponent]::Content
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
