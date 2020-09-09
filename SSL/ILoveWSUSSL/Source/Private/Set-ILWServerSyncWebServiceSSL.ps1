function Set-ILWServerSyncWebServiceSSL {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = $SSLState
        WSUSComponent = [WSUSComponent]::ServerSyncWebService
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}