function Set-ILWCertificateBinding {
    param(
        [Parameter(Mandatory = $true)]
        [string]$IssuingCA,
        [Parameter(Mandatory = $false)]
        [string]$WebSite = 'WSUS Administration'
    )
    try {
        $WSUS_Server = Get-WsusServer -ErrorAction Stop
    }
    catch {
        # This is not a WSUS server, or it is in an error state. Return non-compliant.
        return $false
    }


}