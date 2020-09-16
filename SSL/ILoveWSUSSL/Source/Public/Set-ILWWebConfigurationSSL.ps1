function Set-ILWWebConfigurationSSL {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [WSUSComponent[]]$WSUSComponent = [System.Enum]::GetValues('WSUSComponent'),
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    begin {
        $setWebConfigurationPropertySplat = @{
            Filter = '/system.webServer/security/Access'
            PSPath = 'MACHINE/WEBROOT/APPHOST'
            Name   = 'sslFlags'
        }
    }
    process {
        foreach ($Component in $WSUSComponent) {
            $setWebConfigurationPropertySplat['Value'] = Resolve-ILWDesiredSSLState -WSUSComponent $Component -SSLState $SSLState

            $SitePath = [string]::Format('WSUS Administration/{0}', $Component)
            $setWebConfigurationPropertySplat['Location'] = $SitePath
            Set-WebConfigurationProperty @setWebConfigurationPropertySplat
            Write-Verbose "Successfully configured $Component to have an SSL state of $SSLState"
        }
    }
}