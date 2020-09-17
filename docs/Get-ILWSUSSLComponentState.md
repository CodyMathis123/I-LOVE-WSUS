---
external help file: ILoveWSUSSL-help.xml
Module Name: ILoveWSUSSL
online version:
schema: 2.0.0
---

# Get-ILWSUSSLComponentState

## SYNOPSIS

Returns the SSL configuration for the specified WSUSComponent

## SYNTAX

```
Get-ILWSUSSLComponentState [[-WSUSComponent] <WSUSComponent[]>] [<CommonParameters>]
```

## DESCRIPTION

This function will parse the web config for the specified WSUSComponent and return the currently configured SSL state.

## EXAMPLES

### Example 1

```ps
PS C:\> Get-ILWSUSSLComponentState
```

Returns the SSL state for all WSUSComponent

### Example 2

```ps
PS C:\> Get-ILWSUSSLComponentState -WSUSComponent ApiRemoting30
```

Returns the SSL state for the ApiRemoting30 WSUSComponent

## PARAMETERS

### -WSUSComponent

Enum that encompasses all IIS based WSUS Components. Can specify one, or multiple. Defaults to all components.

```yaml
Type: WSUSComponent[]
Parameter Sets: (All)
Aliases:
Accepted values: ApiRemoting30, ClientWebService, Content, DssAuthWebService, Inventory, ReportingWebService, SelfUpdate, ServerSyncWebService, SimpleAuthWebService

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### [Ordered]@{}

## NOTES

## RELATED LINKS
