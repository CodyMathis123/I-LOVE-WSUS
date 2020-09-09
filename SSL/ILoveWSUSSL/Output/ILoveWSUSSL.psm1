#Region '.\Enum\WSUSComponent.ps1' 0
enum WSUSComponent {
    ApiRemoting30
    ClientWebService
    Content
    DssAuthWebService
    Inventory
    ReportingWebService
    SelfUpdate
    ServerSyncWebService
    SimpleAuthWebService
}
#EndRegion '.\Enum\WSUSComponent.ps1' 11
#Region '.\Private\Set-ILWWebConfigurationSSL.ps1' 0
#EndRegion '.\Private\Set-ILWWebConfigurationSSL.ps1' 0
#Region '.\Public\Set-ILWApiRemoting30SSL.ps1' 0
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
#EndRegion '.\Public\Set-ILWApiRemoting30SSL.ps1' 12
#Region '.\Public\Set-ILWClientWebServiceSSL.ps1' 0
function Set-ILWClientWebServiceSSL {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = $SSLState
        WSUSComponent = [WSUSComponent]::ClientWebService
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
#EndRegion '.\Public\Set-ILWClientWebServiceSSL.ps1' 12
#Region '.\Public\Set-ILWContentSSL.ps1' 0
function Set-ILWContentSSL {
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = 'Disabled'
        WSUSComponent = [WSUSComponent]::Content
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
#EndRegion '.\Public\Set-ILWContentSSL.ps1' 7
#Region '.\Public\Set-ILWDssAuthWebServiceSSL.ps1' 0
function Set-ILWDssAuthWebServiceSSL {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = $SSLState
        WSUSComponent = [WSUSComponent]::DssAuthWebService
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
#EndRegion '.\Public\Set-ILWDssAuthWebServiceSSL.ps1' 12
#Region '.\Public\Set-ILWInventorySSL.ps1' 0

function Set-ILWInventorySSL {
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = 'Disabled'
        WSUSComponent = [WSUSComponent]::Inventory
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
#EndRegion '.\Public\Set-ILWInventorySSL.ps1' 8
#Region '.\Public\Set-ILWReportingWebServiceSSL.ps1' 0
function Set-ILWReportingWebServiceSSL {
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = 'Disabled'
        WSUSComponent = [WSUSComponent]::ReportingWebService
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
#EndRegion '.\Public\Set-ILWReportingWebServiceSSL.ps1' 7
#Region '.\Public\Set-ILWSelfUpdateSSL.ps1' 0
function Set-ILWSelfUpdateSSL {
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = 'Disabled'
        WSUSComponent = [WSUSComponent]::SelfUpdate
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
#EndRegion '.\Public\Set-ILWSelfUpdateSSL.ps1' 7
#Region '.\Public\Set-ILWServerSyncWebServiceSSL.ps1' 0
function Set-ILWServerSyncWebServiceSSL {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = $SSLState
        WSUSComponent = [WSUSComponent]::ServerSyncWebService
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
#EndRegion '.\Public\Set-ILWServerSyncWebServiceSSL.ps1' 12
#Region '.\Public\Set-ILWSimpleAuthWebServiceSSL.ps1' 0
function Set-ILWSimpleAuthWebServiceSSL {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    $setILWWebConfigurationSSLSplat = @{
        SSLState      = $SSLState
        WSUSComponent = [WSUSComponent]::SimpleAuthWebService
    }
    Set-ILWWebConfigurationSSL @setILWWebConfigurationSSLSplat
}
#EndRegion '.\Public\Set-ILWSimpleAuthWebServiceSSL.ps1' 12
#Region '.\Public\Set-ILWSUSSSLState.ps1' 0
function Set-ILWSUSSSLState {
    param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('Enabled', 'Disabled')]
    [string]$SSLState   
    )
    $setILWSUSSSLStateSplat = @{
        SSLState      = $SSLState
    }

    Set-ILWApiRemoting30SSL @setILWSUSSSLStateSplat
    Set-ILWClientWebServiceSSL @setILWSUSSSLStateSplat
    Set-ILWContentSSL
    Set-ILWDSSAuthWebServiceSSL @setILWSUSSSLStateSplat
    Set-ILWInventorySSL
    Set-ILWReportingWebServiceSSL
    Set-ILWSelfUpdateSSL
    Set-ILWServerSyncWebServiceSSL @setILWSUSSSLStateSplat
    Set-ILWSimpleAuthWebServiceSSL @setILWSUSSSLStateSplat
}
#EndRegion '.\Public\Set-ILWSUSSSLState.ps1' 20
