---
external help file: ILoveWSUSSL-help.xml
Module Name: ILoveWSUSSL
online version:
schema: 2.0.0
---

# Test-ILWSUSIsSSL

## SYNOPSIS

Return a boolean value indicating whether WSUS is currently configured for SSL.

## SYNTAX

```powershell
Test-ILWSUSIsSSL [<CommonParameters>]
```

## DESCRIPTION

This function is used to test whether WSUS is currently configured for SSL. This test is done by using the UsingSSL registry property in the WSUS Server\Setup key.

## EXAMPLES

### Example 1

```powershell
PS C:\> Test-ILWSUSIsSSL

$false
```

The current WSUS server is not in SSL mode.

### Example 2

```powershell
PS C:\> Test-ILWSUSIsSSL

$true
```

The current WSUS server is currently in SSL mode.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Boolean

## NOTES

## RELATED LINKS
