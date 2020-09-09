
function Set-ILWInventorySSL {
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = 'Disabled'
        WSUSComponent = [WSUSComponent]::Inventory
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
