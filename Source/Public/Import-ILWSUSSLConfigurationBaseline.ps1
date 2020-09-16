function Import-ILWSUSSLConfigurationBaseline {
    param(
        [Parameter(Mandatory = $false)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState = 'Enabled'
    )
    $CMSiteDrive = Get-PSDrive -PSProvider CMSite -ErrorAction SilentlyContinue
    $SiteCode = switch ($CMSiteDrive.Count) {
        1 {
            $CMSiteDrive.SiteCode
        }
        0 {
            Write-Warning "Please import the Configuration Manager module before using this function"
            return
        }
        default {
            ($CMSiteDrive | Select-Object -Property SiteCode, SiteServer, Description, IsConnected | Out-GridView -Title 'Please select a site to connect to.' -OutputMode Single).SiteCode
        }
    }

    if (-not [string]::IsNullOrWhiteSpace($SiteCode)) {
        $SiteCodePath = [string]::Format('{0}:\', $SiteCode)
        Set-Location -Path $SiteCodePath
    }

    $EnumObject = [WSUSComponent]
    $EnumAsString = Convert-EnumToString -EnumToConvert $EnumObject
    [string[]]$EnumValues = [System.Enum]::GetValues($EnumObject.Name)
    $scriptblockGetILWSUSSLState = Convert-FunctionToString -FunctionToConvert Get-ILWSUSSLState
    $scriptblockResolveILWDesiredSSLState = Convert-FunctionToString -FunctionToConvert Resolve-ILWDesiredSSLState
    $scriptblockSetILWWebConfigurationSSL = Convert-FunctionToString -FunctionToConvert Set-ILWWebConfigurationSSL

    $Baseline = New-CMBaseline -Name "WSUS SSL $SSLState" -Description "CB to ensure the WSUS IIS Components are correctly configured to set SSL to $SSLState"

    foreach ($Component in $EnumValues) {
        $ExpectedValue = Resolve-ILWDesiredSSLState -WSUSComponent $Component -SSLState $SSLState
        Write-Progress -Activity 'Creating WSUS SSL CI' -Status "$Component SSL CI: [Desired State: $ExpectedValue]" -PercentComplete $((($EnumValues.IndexOf($Component) + 1) / $EnumValues.Count) * 100) -CurrentOperation 'CI Creation' -Id 1
        $FullScriptBlockDetection = [string]::Join([System.Environment]::NewLine, @($EnumAsString, $scriptblockGetILWSUSSLState, [string]::Format('(Get-ILWSUSSLState -WSUSComponent {0}).{0}', $Component)))
        $FullScriptBlockRemediate = [string]::Join([System.Environment]::NewLine, @($EnumAsString, $scriptblockSetILWWebConfigurationSSL, $scriptblockResolveILWDesiredSSLState, [string]::Format('Set-ILWWebConfigurationSSL -WSUSComponent {0} -SSLState {1}', $Component, $SSLState)))

        $newCMConfigurationItemSplat = @{
            Name         = [string]::Format('WSUS - {0} SSL seto to {1}', $Component, $ExpectedValue)
            Description  = [string]::Format('PowerShell scripts that ensure the {0} component of WSUS is properly configured for SSL', $Component)
            CreationType = 'WindowsApplication'
        }

        $ComponentCI = New-CMConfigurationItem @newCMConfigurationItemSplat

        $addCMComplianceSettingScriptSplat = @{
            DataType                  = 'String'
            Remediate                 = $true
            DiscoveryScriptLanguage   = 'PowerShell'
            DiscoveryScriptText       = $FullScriptBlockDetection
            RemediationScriptLanguage = 'PowerShell'
            RemediationScriptText     = $FullScriptBlockRemediate
            ExpectedValue             = $ExpectedValue
            ExpressionOperator        = 'IsEquals'
            Name                      = [string]::Format('{0} SSL {1}', $Component, $ExpectedValue)
            InputObject               = $ComponentCI
            NoncomplianceSeverity     = 'Warning'
            ReportNoncompliance       = $true
            RuleName                  = [string]::Format('Must Return {0}', $ExpectedValue)
            ValueRule                 = $false
            Is64Bit                   = $true
        }

        $Null = Add-CMComplianceSettingScript @addCMComplianceSettingScriptSplat

        Write-Progress -Activity 'Adding WSUS SSL CI to CB' -Status "$Component SSL CI being added to CB" -PercentComplete $((($EnumValues.IndexOf($Component) + 1) / $EnumValues.Count) * 100) -CurrentOperation 'CB Configuration' -Id 2 -ParentId 1
        Set-CMBaseline -AddRequiredConfigurationItem $ComponentCI.CI_ID -InputObject $Baseline
    }
    Write-Progress -Activity 'Adding WSUS SSL CI to CB' -Completed -CurrentOperation 'CB Configuration' -Id 2 -ParentId 1
    Write-Progress -Activity 'Creating WSUS SSL CI' -Completed -CurrentOperation 'CI Creation' -Id 1

    # [xml]$Def = (Get-CMConfigurationItem)[1] | Select-Object -ExpandProperty sdmpackagexml
    # $xmldef.DesiredConfigurationDigest.Application.ScriptDiscoveryInfo.ScriptType = 'PowerShell'
    # $xmldef.DesiredConfigurationDigest.Application.ScriptDiscoveryInfo.Script = 'Bacon Is Really Delicious'
    # Set-CMConfigurationItem -InputObject (Get-CMConfigurationItem)[1] -DigestXml $xmldef.OuterXml
}