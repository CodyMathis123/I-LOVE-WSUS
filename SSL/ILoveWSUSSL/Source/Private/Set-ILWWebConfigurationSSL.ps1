function Set-ILWWebConfigurationSSL {
    param(
        [Parameter(Mandatory = $true)]
        [WSUSComponent[]]$WSUSComponent,
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    begin {
        $SSLValue = switch ($SSLState) {
            Enabled {
                'Ssl'
            }
            Disabled {
                'None'
            }
        }
        $setWebConfigurationPropertySplat = @{
            Filter = '/system.webServer/security/Access'
            PSPath = 'MACHINE/WEBROOT/APPHOST'
            Name   = 'sslFlags'
            Value  = $SSLValue
        }
    }
    process {
        foreach ($Component in $WSUSComponent) {
            $SitePath = [string]::Format('WSUS Administration/{0}', $Component)
            $setWebConfigurationPropertySplat['Location'] = $SitePath
            Set-WebConfigurationProperty @setWebConfigurationPropertySplat
        }
    }
}