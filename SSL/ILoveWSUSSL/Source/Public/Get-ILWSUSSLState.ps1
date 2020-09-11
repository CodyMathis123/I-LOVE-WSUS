function Get-ILWSUSSLState {
    param(
        [Parameter(Mandatory = $false)]
        [WSUSComponent[]]$WSUSComponent
    )
    $WSUSSLState = [Ordered]@{}
    $getWebConfigurationPropertySplat = @{
        Filter      = '/system.webServer/security/Access'
        Name        = 'sslFlags'
        PSPath      = 'MACHINE/WEBROOT/APPHOST'
        ErrorAction = 'Stop'
    }
    [string[]]$WSUSComponent = switch ($PSBoundParameters.ContainsKey('WSUSComponent')) {
        $true {
            $WSUSComponent
        }
        $false {
            [System.Enum]::GetValues('WSUSComponent')
        }
    }
    foreach ($Component in $WSUSComponent) {
        $SitePath = [string]::Format('WSUS Administration/{0}', $Component)
        $getWebConfigurationPropertySplat['Location'] = $SitePath
        try {
            $sslFlags = Get-WebConfigurationProperty @getWebConfigurationPropertySplat
            switch ($sslFlags.GetType().Name) {
                String {
                    $WSUSSLState.Add($Component, $sslFlags)
                }
                ConfigurationAttribute {
                    $WSUSSLState.Add($Component, $(switch ($sslFlags.Value) {
                                0 {
                                    'Disabled'
                                }
                                default {
                                    'Unknown'
                                }
                            }))
                }
            }
        }
        catch {
            $WSUSSLState.Add($Component, 'Disabled')
        }
    }
    
    Write-Output $WSUSSLState
}