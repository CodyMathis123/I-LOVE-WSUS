function Convert-EnumToString {
    <#
        .SYNOPSIS
            Convert a basic enum to string
        .DESCRIPTION
            This function is used to take an anum, and convert it to a string. This allows it to be
            moved around more easily for generating scripts and scriptblocks dynamically
        .PARAMETER EnumToConvert
            The name of the function(s) you wish to convert to a string. You can provide multiple
        .EXAMPLE
            PS C:\> Convert-EnumToString -EnumToConvert [WSUSComponent]
        .NOTES
            FileName:    Convert-FunctionTostring.ps1
            Author:      Cody Mathis
            Contact:     @CodyMathis123
            Created:     2020-09-10
            Updated:     2020-09-10
#>
    param(
        [Parameter(Mandatory = $True)]
        [object]$EnumToConvert
    )
    try {
        [string[]]$EnumValues = [System.Enum]::GetValues($EnumToConvert.Name)
        [string]::Format("`r`nenum {0} {{`r`n{1}`r`n}}", $EnumToConvert.Name, [string]::Join([System.Environment]::NewLine, $EnumValues))
    }
    catch {
        Write-Error "An error occurred while processing the enum $($EnumToConvert.Name)"
    }
}