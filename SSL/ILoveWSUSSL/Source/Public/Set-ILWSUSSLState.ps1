function Set-ILWSUSSLState {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState   
    )

    Set-ILWWebConfigurationSSL -SSLState $SSLState
}