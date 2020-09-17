function Test-ILWSUSSLState {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [WSUSComponent[]]$WSUSComponent = [System.Enum]::GetValues('WSUSComponent'),
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $CurrentState = Get-ILWSUSSLState -WSUSComponent $WSUSComponent
    foreach ($Component in $WSUSComponent) {
        $DesiredComponentState = Resolve-ILWDesiredSSLState -WSUSComponent $Component -SSLState $SSLState
        Write-Verbose "$Component has current state of $($CurrentState[$Component.ToString()]) and we expect it to be $DesiredComponentState"
        if ($CurrentState[$Component.ToString()] -ne $DesiredComponentState) {
            Write-Warning "At least one component is misconfigured. Returning false."
            return $false
        }
    }

    return $true
}