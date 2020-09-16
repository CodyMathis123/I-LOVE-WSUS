---
external help file: ILoveWSUSSL-help.xml
Module Name: ILoveWSUSSL
online version:
schema: 2.0.0
---

# Set-ILWSUSSLState

## SYNOPSIS

Configures all WSUSComponent to the desired SSLState

## SYNTAX

```
Set-ILWSUSSLState [-SSLState] <String> [<CommonParameters>]
```

## DESCRIPTION

This function is used to properly configure the IIS WSUSComponents to the desired SSLState, either Enabled or Disabled.

It will automatically account for WSUSComponents such as Content for example, which should never be SSL.

## EXAMPLES

### Example 1

```ps
PS C:\> Set-ILWSUSSLState -SSLState Enabled
```

Configures all WSUSComponent in IIS to be compatible with an SSL WSUS server.

### Example 2

```ps
PS C:\> Set-ILWSUSSLState -SSLState Disabled
```

Configures all WSUSComponent in IIS to be compatible with a non-SSL WSUS server.

## PARAMETERS

### -SSLState

The desired state for SSL compatibility for the local WSUS server, either Enabled, or Disabled.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Enabled, Disabled

Required: True
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
