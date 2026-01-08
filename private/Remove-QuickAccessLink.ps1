function Remove-QuickAccessLink {
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
        ($QuickAccess.Namespace('shell:::{679f85cb-0220-4080-b29b-5540cc05aab6}').Items() | 
                Where-Object { $_.Path -eq $Path }).InvokeVerb('unpinfromhome')
        }
    }
    
    end {
        
    }
}
