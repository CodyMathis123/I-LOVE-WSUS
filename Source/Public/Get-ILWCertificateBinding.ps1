function Get-ILWCertificateBinding {
    param(
        [Parameter(Mandatory = $false)]
        [string]$WebSite = 'WSUS Administration'
    )
    $Binding = Get-WebBinding -Name $Website -Protocol https

    if ($null -eq $Binding) {
        Write-Warning "No webbinding found for [Website: $Website]"
        return [string]::Empty
    }
    else {
        return $Binding.CertificateHash
    }
}