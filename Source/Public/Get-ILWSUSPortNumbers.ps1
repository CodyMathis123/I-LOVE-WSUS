function Get-ILWSUSPortNumbers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [object]$WSUSServer = (Get-WSUSServer)
    )
    #region Determine WSUS Port Numbers
    $WSUS_IsSSL = $WSUSServer.UseSecureConnection
    $ListeningPort = $WSUSServer.PortNumber
    $WSUSPortInfo = [ordered]@{}
    $WSUSPortInfo['WSUSIsSSL'] = $WSUS_IsSSL

    switch ($WSUS_IsSSL) {
        $true {
            $WSUSPortInfo['HttpPort'] = switch ($ListeningPort) {
                443 {
                    80
                }
                default {
                    $ListeningPort - 1
                }
            }
            $WSUSPortInfo['HttpsPort'] = $ListeningPort
        }
        $false {
            $WSUSPortInfo['HttpPort'] = $ListeningPort
            $WSUSPortInfo['HttpsPort'] = switch ($ListeningPort) {
                80 {
                    443
                }
                Default {
                    $ListeningPort + 1
                }
            }
        }
    }
    #endregion Determine WSUS Port Numbers

    return $WSUSPortInfo
}