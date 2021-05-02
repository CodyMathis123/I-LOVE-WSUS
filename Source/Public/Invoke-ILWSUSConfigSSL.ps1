function Invoke-ILWSUSConfigSSL {
    param(
        [Parameter(Mandatory = $false)]
        [string]$ServerCertificateName = [SYSTEM.NET.DNS]::GetHostByName($env:COMPUTERNAME).hostname
    )
    $WSUSUtil = Join-Path -Path $env:ProgramFiles -ChildPath 'Update Services\tools\WsusUtil.exe'
    if(Test-Path -Path $WSUSUtil -PathType Leaf){
        Start-Process -FilePath $WSUSUtil -ArgumentList 'configuressl', $ServerCertificateName -NoNewWindow -Wait
    }
    else {
        Write-Error -Exception [System.IO.FileNotFoundException] -Message 'Failed to find WsusUtil.exe. Please verify this is a WSUS server and try again' -Category ObjectNotFound    }
}