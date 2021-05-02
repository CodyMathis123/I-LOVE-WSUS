---
external help file: ILoveWSUSSL-help.xml
Module Name: ILoveWSUSSL
online version:
schema: 2.0.0
---

# Invoke-ILWSUSConfigSSL

## SYNOPSIS

Invokes the WsusUtil configuressl command with the specified ServerCertificateName.

## SYNTAX

```powershell
Invoke-ILWSUSConfigSSL [-ServerCertificateName] <String> [<CommonParameters>]
```

## DESCRIPTION

This command is used to simplify calling the wsusutil.exe for configuressl.

## EXAMPLES

### Example 1

```powershell
PS C:\> Invoke-ILSWSUSConfigSSL -ServerCertificateName WSUS.CONTOSO.LOCAL
```

Executes .\wsusutil.exe configuressl WSUS.CONTOSO.LOCAL

### Example 2

```powershell
PS C:\> Invoke-ILSWSUSConfigSSL
```

Executes .\wsusutil.exe configuressl \<FQDN> where FQDN is gathered automatically for the local server.

## PARAMETERS

### -SSLState

The SSL State which the function should test for. This can be either Disabled, or Enabled.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: [SYSTEM.NET.DNS]::GetHostByName($env:COMPUTERNAME).hostname
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
