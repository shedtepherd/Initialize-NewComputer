$Public = @(Get-ChildItem .\public\*.ps1 | select BaseName)
$Private = @()
try{
    #import scripts
}