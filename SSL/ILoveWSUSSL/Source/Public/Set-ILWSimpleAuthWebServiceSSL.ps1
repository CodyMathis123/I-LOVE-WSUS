function Set-ILWSimpleAuthWebServiceSSL {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = $SSLState
        WSUSComponent = [WSUSComponent]::SimpleAuthWebService
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}