function Set-ILWClientWebServiceSSL {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = $SSLState
        WSUSComponent = [WSUSComponent]::ClientWebService
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
