function Set-ILWSUSSLComponentState {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState   
    )

    Set-ILWWebConfigurationSSL -SSLState $SSLState
}