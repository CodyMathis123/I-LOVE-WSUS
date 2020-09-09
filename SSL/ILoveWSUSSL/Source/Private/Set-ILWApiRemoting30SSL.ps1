function Set-ILWApiRemoting30SSL {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = $SSLState
        WSUSComponent = [WSUSComponent]::ApiRemoting30
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
