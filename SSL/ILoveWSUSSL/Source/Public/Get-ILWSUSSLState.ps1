function Get-ILWSUSSLState {
    $WSUSSLState = [Ordered]@{}
    $getWebConfigurationPropertySplat = @{
        Filter      = '/system.webServer/security/Access'
        Name        = 'sslFlags'
        PSPath      = 'MACHINE/WEBROOT/APPHOST'
        ErrorAction = 'Stop'
    }
    $WSUSComponent = [System.Enum]::GetValues('WSUSComponent')
    foreach ($Component in $WSUSComponent) {
        $SitePath = [string]::Format('WSUS Administration/{0}', $Component)
        $getWebConfigurationPropertySplat['Location'] = $SitePath
        try {
            $sslFlags = Get-WebConfigurationProperty @getWebConfigurationPropertySplat
            switch ($sslFlags.GetType().Name) {
                String {
                    $WSUSSLState[$Component] = $sslFlags
                }
                ConfigurationAttribute {
                    $WSUSSLState[$Component] = switch ($sslFlags.Value) {
                        0 {
                            'Disabled'
                        }
                        default {
                            'Unknown'
                        }
                    }
                }
            }
        }
        catch {
            $WSUSSLState[$Component] = 'Disabled'
        }
    }
    $WSUSSLState
}