function Import-ILWSUSSLConfigurationItem {
    [Alias('Import-ILWSUSSLCI')]
    param()
    # TODO - Need to code the 'enable SSL' stuff including a detection script

    $EnumObject = [WSUSComponent]
    $EnumAsString = Convert-EnumToString -EnumToConvert $EnumObject
    [string[]]$EnumValues = [System.Enum]::GetValues($EnumObject.Name)
    $scriptblockGetILWSUSSLState = Convert-FunctionToString -FunctionToConvert Get-ILWSUSSLState

    foreach ($Component in $EnumValues) {
        $FunctionName = [string]::Format('Set-ILW{0}SSL', $Component)
        $scriptblockSetSSL = Convert-FunctionToString -FunctionToConvert $FunctionName

        $FullScriptBlockDetection = [string]::Join([System.Environment]::NewLine, @($EnumAsString, $scriptblockGetILWSUSSLState, [string]::Format('(Get-ILWSUSSLState -WSUSComponent {0}).{0}', $Component)))

        $FullScriptBlockRemediate = [string]::Join([System.Environment]::NewLine, @($EnumAsString, $scriptblockSetSSL, [string]::Format('{0} -SSLState Enabled', $FunctionName)))

        $newCMConfigurationItemSplat = @{
            Name         = [string]::Format('WSUS - {0} Enable SSL', $Component)
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
            ExpectedValue             = 'SSL'
            ExpressionOperator        = 'IsEquals'
            Name                      = [string]::Format('{0} SSL', $Component)
            InputObject               = $ComponentSSLCI
            NoncomplianceSeverity     = 'Warning'
            ReportNoncompliance       = $true
            RuleName                  = 'Must Return SSL'
            ValueRule                 = $false
            Is64Bit                   = $true
        }

        Add-CMComplianceSettingScript @addCMComplianceSettingScriptSplat
    }

    [xml]$Def = (Get-CMConfigurationItem)[1] | Select-Object -ExpandProperty sdmpackagexml
    $xmldef.DesiredConfigurationDigest.Application.ScriptDiscoveryInfo.ScriptType = 'PowerShell'
    $xmldef.DesiredConfigurationDigest.Application.ScriptDiscoveryInfo.Script = 'Bacon Is Really Delicious'
    Set-CMConfigurationItem -InputObject (Get-CMConfigurationItem)[1] -DigestXml $xmldef.OuterXml
}