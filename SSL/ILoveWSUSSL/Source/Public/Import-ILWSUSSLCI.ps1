function Import-ILWSUSSLConfigurationItem {
    [Alias('Import-ILWSUSSLCI')]
    param(
        [Parameter(Mandatory = $false)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState = 'Enabled'
    )
    # TODO - Need to code the 'enable SSL' stuff including a detection script
    # TODO - Create a CI that runs on your Site Server, queries the compliance of the other CI, and if compliant flips the SUP to HTTPS
    # TODO - Create a CB for enable / disable and can reuse the CI for the non-HTTPS compat

    $EnumObject = [WSUSComponent]
    $EnumAsString = Convert-EnumToString -EnumToConvert $EnumObject
    [string[]]$EnumValues = [System.Enum]::GetValues($EnumObject.Name)
    $scriptblockGetILWSUSSLState = Convert-FunctionToString -FunctionToConvert Get-ILWSUSSLState
    $scriptblockResolveILWDesiredSSLState = Convert-FunctionToString -FunctionToConvert Resolve-ILWDesiredSSLState
    $scriptblockSetILWWebConfigurationSSL = Convert-FunctionToString -FunctionToConvert Set-ILWWebConfigurationSSL

    foreach ($Component in $EnumValues) {
        $ExpectedValue = Resolve-ILWDesiredSSLState -WSUSComponent $Component -SSLState $SSLState
        Write-Progress -Activity 'Creating WSUS SSL CI' -Status "$Component SSL CI: [Desired State: $ExpectedValue]" -PercentComplete $((($EnumValues.IndexOf($Component)+1)/$EnumValues.Count)*100)
        $FullScriptBlockDetection = [string]::Join([System.Environment]::NewLine, @($EnumAsString, $scriptblockGetILWSUSSLState, [string]::Format('(Get-ILWSUSSLState -WSUSComponent {0}).{0}', $Component)))
        $FullScriptBlockRemediate = [string]::Join([System.Environment]::NewLine, @($EnumAsString, $scriptblockSetILWWebConfigurationSSL, $scriptblockResolveILWDesiredSSLState, [string]::Format('Set-ILWWebConfigurationSSL -WSUSComponent {0} -SSLState {1}', $Component, $SSLState)))

        $newCMConfigurationItemSplat = @{
            Name         = [string]::Format('WSUS - {0} SSL {1}', $Component, $ExpectedValue)
            Description  = [string]::Format('PowerShell scripts that ensure the {0} component of WSUS is properly configured for SSL', $Component)
            CreationType = 'WindowsApplication'
        }

        $ComponentSSLCI = New-CMConfigurationItem @newCMConfigurationItemSplat

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
            InputObject               = $ComponentSSLCI
            NoncomplianceSeverity     = 'Warning'
            ReportNoncompliance       = $true
            RuleName                  = [string]::Format('Must Return {0}', $ExpectedValue)
            ValueRule                 = $false
            Is64Bit                   = $true
        }

        $Null = Add-CMComplianceSettingScript @addCMComplianceSettingScriptSplat
    }
    Write-Progress -Activity 'Creating WSUS SSL CI' -Completed

    [xml]$Def = (Get-CMConfigurationItem)[1] | Select-Object -ExpandProperty sdmpackagexml
    $xmldef.DesiredConfigurationDigest.Application.ScriptDiscoveryInfo.ScriptType = 'PowerShell'
    $xmldef.DesiredConfigurationDigest.Application.ScriptDiscoveryInfo.Script = 'Bacon Is Really Delicious'
    Set-CMConfigurationItem -InputObject (Get-CMConfigurationItem)[1] -DigestXml $xmldef.OuterXml
}