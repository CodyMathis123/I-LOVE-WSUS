function Set-ILWReportingWebServiceSSL {
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = 'Disabled'
        WSUSComponent = [WSUSComponent]::ReportingWebService
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
