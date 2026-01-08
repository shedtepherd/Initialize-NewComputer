function Add-QuickAccessLink {
    <#
    .SYNOPSIS
    Short description
    
    .DESCRIPTION
    Long description
    
    .PARAMETER Path
    Parameter description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param (
        # Specifies a path
        [Parameter(Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            
            HelpMessage = 'Path to one or more locations.')]
        [Alias('PSPath')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Path
    )
    
    begin {
        $QuickAccess = New-Object -ComObject shell.application
    }
    
    process {
        foreach ($Item in $Path) {
            $QuickAccess.Namespace("$($Item)").Self.InvokeVerb('pintohome') 
        }
    }
    
    end {
        
    }
}
