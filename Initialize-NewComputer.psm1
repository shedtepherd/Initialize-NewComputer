$Public = @(Get-ChildItem -Path $PSScriptRoot\public\*.ps1 -ErrorAction SilentlyContinue)
$Private = @(Get-ChildItem -Path $PSScriptRoot\private\*.ps1 -ErrorAction SilentlyContinue)
foreach ($Script in @($Public + $Private)) {
    try {
        . $Script.fullname
    }
    catch {
        Write-Error -Message "Failed to import function $($Script.FullName) : $_"
    }
}
Export-ModuleMember -Function $Public.BaseName