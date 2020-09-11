function Import-ILWSUSSLConfigurationItem {
    [Alias('Import-ILWSUSSLCI')]
    param()
    # TODO - Create the appropriate scriptblocks
    # TODO - Create all the CIs
    # TODO - Need the code for the requirements
    # TODO - Need to code the 'enable SSL' stuff

    $EnumObject = [WSUSComponent]
    $EnumAsString = Convert-EnumToString -EnumToConvert $EnumObject
    
    $ScriptBlock1 = Convert-FunctionToString -FunctionToConvert Set-ILWApiRemoting30SSL
    $ScriptBlock2 = Convert-FunctionToString -FunctionToConvert Get-ILWSUSSLState

    $FullScriptBlockDetection = [string]::Join([System.Environment]::NewLine, @($EnumAsString, $ScriptBlock2, '(Get-ILWSUSSLState -WSUSComponent ApiRemoting30).ApiRemoting30'))

    $FullScriptBlockRemediate = [string]::Join([System.Environment]::NewLine, @($EnumAsString, $ScriptBlock1, 'Set-ILWApiRemoting30SSL -SSLState Enabled'))

    $ApiRemoting30CI = New-CMConfigurationItem -Name 'WSUS - ApiRemoting30 Enable SSL' -Description 'PowerShell scripts that ensure the ApiRemoting30 component of WSUS is properly configured for SSL' -CreationType WindowsApplication

    Add-CMComplianceSettingScript -DataType String -Remediate -DiscoveryScriptLanguage PowerShell -DiscoveryScriptText $FullScriptBlockDetection -RemediationScriptLanguage PowerShell -RemediationScriptText $FullScriptBlockRemediate -ExpectedValue 'SSL' -ExpressionOperator IsEquals -Name 'ApiRemoting30 SSL' -InputObject $ApiRemoting30CI -NoncomplianceSeverity Warning -ReportNoncompliance -RuleName 'Must Return SSL' -ValueRule:$false
    
}