function Get-ILWSUSPortNumbers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [Microsoft.UpdateServices.Internal.BaseApi.UpdateServer]$WSUSServer = (Get-WSUSServer)
    )
    #region Determine WSUS Port Numbers
    $WSUS_Port1 = $WSUSServer.PortNumber
    $WSUS_IsSSL = $WSUSServer.UseSecureConnection

    switch ($WSUS_IsSSL) {
        $true {
            switch ($WSUS_Port1) {
                443 {
                    $WSUS_Port2 = 80
                }
                default {
                    $WSUS_Port2 = $WSUS_Port1 - 1
                }
            }
        }
        $false {
            $Wsus_Port2 = $null
        }
    }
    #endregion Determine WSUS Port Numbers

    return [PSCustomObject]@{
        WSUSIsSSL = $WSUS_IsSSL
        WSUSPort1 = $WSUS_Port1
        WSUSPort2 = $WSUS_Port2
    }
}