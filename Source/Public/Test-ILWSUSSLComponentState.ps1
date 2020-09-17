function Test-ILWSUSSLComponentState {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [WSUSComponent[]]$WSUSComponent = [System.Enum]::GetValues('WSUSComponent'),
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $CurrentState = Get-ILWSUSSLComponentState -WSUSComponent $WSUSComponent
    foreach ($Component in $WSUSComponent) {
        $DesiredComponentState = Resolve-ILWDesiredSSLState -WSUSComponent $Component -SSLState $SSLState
        $ComponentCurrentState = $CurrentState[$Component.ToString()]
        Write-Verbose "$Component has current state of $ComponentCurrentState and we expect it to be $DesiredComponentState"
        if ($ComponentCurrentState -ne $DesiredComponentState) {
            Write-Warning "At least one component is misconfigured [Component: $Component] [CurrentState: $ComponentCurrentState] [DesiredState: $DesiredComponentState] Returning false."
            return $false
        }
    }

    return $true
}