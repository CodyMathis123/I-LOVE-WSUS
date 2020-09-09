---
external help file: ILoveWSUSSL-help.xml
Module Name: ILoveWSUSSL
online version:
schema: 2.0.0
---

# Set-ILWApiRemoting30SSL

## SYNOPSIS
Enable or Disable SSL for the ApiRemoting30 WSUS component

## SYNTAX

```
Set-ILWApiRemoting30SSL [-SSLState] <String> [<CommonParameters>]
```

## DESCRIPTION
This function can be used to configure the SSL state for the ApiRemoting30 WSUS component.

This can either be Enabled, or Disabled. The recommended configuration is 'Enabled'

## EXAMPLES

### Example 1
```powershell
PS C:\> Set-ILWApiRemoting30SSL -SSLState Enabled
```

Configures the ApiRemoting30 WSUS Component to have SSL Enabled

### Example 2
```powershell
PS C:\> Set-ILWApiRemoting30SSL -SSLState Disabled
```

Configures the ApiRemoting30 WSUS Component to have SSL Disabled

## PARAMETERS

### -SSLState
The desired SSL state, either Enabled or Disabled.

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

### System.Object
## NOTES

## RELATED LINKS
