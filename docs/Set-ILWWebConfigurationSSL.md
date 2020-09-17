---
external help file: ILoveWSUSSL-help.xml
Module Name: ILoveWSUSSL
online version:
schema: 2.0.0
---

# Set-ILWWebConfigurationSSL

## SYNOPSIS

Configures the specified WSUSComponent to the desired SSLState

## SYNTAX

```
Set-ILWWebConfigurationSSL [[-WSUSComponent] <WSUSComponent[]>] [-SSLState] <String> [<CommonParameters>]
```

## DESCRIPTION

This function is used to properly configure the specified IIS WSUSComponents to the desired SSLState, either Enabled or Disabled.

It will automatically account for WSUSComponents such as Content for example, which should never be SSL.

## EXAMPLES

### Example 1

```ps
PS C:\> Set-ILWWebConfigurationSSL -WSUSComponent ApiRemoting30 -SSLState Disabled
```

Configures the ApiRemoting30 WSUSComponent in IIS to be compatible with a non-SSL WSUS server.

### Example 2

```ps
PS C:\> Set-ILWWebConfigurationSSL -WSUSComponent ApiRemoting30,Content -SSLState Enabled
```

Configures the ApiRemoting30 and Content WSUSComponent in IIS to be compatible with an SSL WSUS server. 
Because the Content virtual directory should always use HTTP the function will not allow it to be configured to SSL,
but will ensure it is configured properly for HTTP instead.

## PARAMETERS

### -SSLState

The desired state for SSL compatibility for the local WSUS server, either Enabled, or Disabled.

```yaml
Type: String
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

### None

## NOTES

## RELATED LINKS
