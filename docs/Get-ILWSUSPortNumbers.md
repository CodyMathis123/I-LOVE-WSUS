---
external help file: ILoveWSUSSL-help.xml
Module Name: ILoveWSUSSL
online version:
schema: 2.0.0
---

# Get-ILWSUSPortNumbers

## SYNOPSIS
Return the port numbers in use by WSUS, and the SSL state

## SYNTAX

```
Get-ILWSUSPortNumbers [[-WSUSServer] <Object>] [<CommonParameters>]
```

## DESCRIPTION

This function will automatically determine the ports in use by WSUS, and return them as a PSCustomObject.

If WSUS is set to use any custom port other than 80/443 it 
    automatically determines the HTTP as noted in the link below
    https://docs.microsoft.com/en-us/windows-server/administration/windows-server-update-services/deploy/2-configure-wsus#configure-ssl-on-the-wsus-server
        ... if you use any port other than 443 for HTTPS traffic, 
        WSUS will send clear HTTP traffic over the port that numerically 
        comes before the port for HTTPS. For example, if you use port 8531 for HTTPS, 
        WSUS will use port 8530 for HTTP.

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-ILWSUSPortNumbers
```

Return the WSUS port info for the local WSUSServer

### Example 2

```powershell
PS C:\> Get-ILWSUSPortNumbers -WSUSServer (Get-WSUSServer -Name WSUS1.CONTOSO.LOCAL)
```

Return the WSUS port info for the WSUS1.CONTOSO.LOCAL WSUS Server

## PARAMETERS

### -WSUSServer

The WSUSServer object you want to gather port info. This is typically gathered with Get-WSUSServer, 
but it defaults to the local server the function is run on.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### [Microsoft.UpdateServices.Internal.BaseApi.UpdateServer]

## OUTPUTS

### [PSCustomeObject]
## NOTES

## RELATED LINKS
