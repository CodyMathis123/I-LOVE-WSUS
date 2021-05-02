---
external help file: ILoveWSUSSL-help.xml
Module Name: ILoveWSUSSL
online version:
schema: 2.0.0
---

# Get-ILWCertificateBinding

## SYNOPSIS

Return the IIS binding object if found for ths specified website, otherwise return $null.

## SYNTAX

```powershell
Get-ILWCertificateBinding [[-WebSite] <String>] [<CommonParameters>]
```

## DESCRIPTION

This function is used to return the IIS binding object for the specified website. It specifically searches for the HTTPS binding. If the respective binding is not found then $null will be returned instead.

## EXAMPLES

### Example 1

```powershell
PS C:\>  Get-ILWCertificateBinding -WebSite 'WSUS Administration'

protocol bindingInformation sslFlags
-------- ------------------ --------
https    :8531:                    0
```

The IIS binding for the WSUS Administration site is returned.

## PARAMETERS

### -WebSite

The name of the IIS website which you want to get the binding for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

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

### Microsoft.IIs.PowerShell.Framework.ConfigurationElement

## NOTES

This will only return HTTPS bindings as we are getting this strictly for the purpose of binding a certificate.

## RELATED LINKS
