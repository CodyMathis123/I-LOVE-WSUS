---
external help file: ILoveWSUSSL-help.xml
Module Name: ILoveWSUSSL
online version:
schema: 2.0.0
---

# Import-ILWSUSSLConfigurationBaseline

## SYNOPSIS

Import Configuration Baseline into MEMCM to Enable or Disable SSL on a WSUS server for the IIS WSUSComponent

## SYNTAX

```powershell
Import-ILWSUSSLConfigurationBaseline [[-SSLState] <String>] [<CommonParameters>]
```

## DESCRIPTION

This function is used to create a set of Configuration Items which will be added to a Configuration Baseline in MEMCM.
You specify the desired SSL state and the scripts are generated and turned into Configuration Items.

## EXAMPLES

### Example 1

```ps
PS C:\> Import-ILWSUSSLConfigurationBaseline -SSLState Enabled
```

Create Configuration Items, and a Configuration Baseline that will ensure a WSUS server has an SSL state of Enabled for the IIS WSUSComponents

### Example 2

```ps
PS C:\> Import-ILWSUSSLConfigurationBaseline -SSLState Disabled
```

Create Configuration Items, and a Configuration Baseline that will ensure a WSUS server has an SSL state of Disabled for the IIS WSUSComponents

## PARAMETERS

### -SSLState

The desired state for SSL compatibility for the local WSUS server, either Enabled, or Disabled.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Enabled, Disabled

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

This function assumes you have already imported the Configuration Manager PowerShell Module. It will attempt to locate a CMSite PSDrive, and set the location.

## RELATED LINKS
