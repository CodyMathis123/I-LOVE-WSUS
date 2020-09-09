function Set-ILWDssAuthWebServiceSSL {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = $SSLState
        WSUSComponent = [WSUSComponent]::DssAuthWebService
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}