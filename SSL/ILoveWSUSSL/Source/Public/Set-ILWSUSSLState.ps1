function Set-ILWSUSSLState {
    param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('Enabled', 'Disabled')]
    [string]$SSLState   
    )
    $setILWSUSSSLStateSplat = @{
        SSLState      = $SSLState
    }

    Set-ILWApiRemoting30SSL @setILWSUSSSLStateSplat
    Set-ILWClientWebServiceSSL @setILWSUSSSLStateSplat
    Set-ILWContentSSL
    Set-ILWDSSAuthWebServiceSSL @setILWSUSSSLStateSplat
    Set-ILWInventorySSL
    Set-ILWReportingWebServiceSSL
    Set-ILWSelfUpdateSSL
    Set-ILWServerSyncWebServiceSSL @setILWSUSSSLStateSplat
    Set-ILWSimpleAuthWebServiceSSL @setILWSUSSSLStateSplat
}