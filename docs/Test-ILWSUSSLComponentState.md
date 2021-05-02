---
external help file: ILoveWSUSSL-help.xml
Module Name: ILoveWSUSSL
online version:
schema: 2.0.0
---

# Test-ILWSUSSLComponentState

## SYNOPSIS

Return a boolean value indicating whether the specified components are configured for the requested SSLState.

## SYNTAX

```powershell
Test-ILWSUSSLComponentState [[-WSUSComponent] <WSUSComponent[]>] [-SSLState] <String> [<CommonParameters>]
```

## DESCRIPTION

This function is used to test the SSLState of an array of WSUSComponent to ensure that the IIS configuration is correct based on Microsoft documentation. The IIS configuration which is appropriate is automatically determined. For example. the Content virtual directory should never be configured for SSL, so if you test with SSLState enabled against this component we will be testing that SSL is not configured for the Content virtual directory.

## EXAMPLES

### Example 1

```powershell
PS C:\> Test-ILWSUSSLComponentState -SSLState Enabled

$true
```

The bool return of $true means that all WSUS Components are correctly configured to have SSL enabled.

## PARAMETERS

### -SSLState

The SSL State which the function should test for. This can be either Disabled, or Enabled.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:
Accepted values: Enabled, Disabled

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WSUSComponent

The WSUS Component which the function should test against. This is populated by an enum and will default to all components.

```yaml
Type: WSUSComponent[]
Parameter Sets: (All)
Aliases:
Accepted values: ApiRemoting30, ClientWebService, Content, DssAuthWebService, Inventory, ReportingWebService, SelfUpdate, ServerSyncWebService, SimpleAuthWebService

Required: False
Position: 0
Default value: [System.Enum]::GetValues('WSUSComponent')
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### WSUSComponent

## OUTPUTS

### System.Boolean

## NOTES

## RELATED LINKS
