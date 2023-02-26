$sourcePath = "D:\source"
$destPath = "C:\Dest"
del comparison.bat 

# Get list of files in destination folder
$destFiles = Get-ChildItem -Path $destPath -File -Recurse | Select-Object -ExpandProperty FullName

# Get list of files in source folder
$sourceFiles = Get-ChildItem -Path $sourcePath -File -Recurse | Select-Object -ExpandProperty FullName

# Compare files in destination folder to files in source folder
foreach ($file in $destFiles) {
    $fileRelPath = $file -replace [regex]::Escape($destPath), ""
    $sourceFile = Join-Path -Path $sourcePath -ChildPath $fileRelPath

    if (-not (Test-Path $sourceFile)) {
        Write-Output ("move " + """" + $file +  """" + " .\move\")  >> "comparison.bat"
    }
}
