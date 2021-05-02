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

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
