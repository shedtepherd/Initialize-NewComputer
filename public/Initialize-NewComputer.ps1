function Initialize-NewComputer {
    Get-Content $PSScriptRoot\..\data\QuickAccessLinks | Add-QuickAccessLink
}
