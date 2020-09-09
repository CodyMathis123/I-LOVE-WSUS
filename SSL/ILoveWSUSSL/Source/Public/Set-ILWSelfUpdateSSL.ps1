function Set-ILWSelfUpdateSSL {
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = 'Disabled'
        WSUSComponent = [WSUSComponent]::SelfUpdate
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
