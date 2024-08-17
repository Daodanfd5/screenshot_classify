$directoryPath = "./img"
$files = Get-ChildItem -Path $directoryPath -Recurse -File

foreach ($file in $files) {
    $sha256 = Get-FileHash -Path $file.FullName -Algorithm SHA256 | Select-Object -ExpandProperty Hash
    $extension = $file.Extension
    $newFileName = "$sha256$extension"
    $newFilePath = Join-Path -Path $file.DirectoryName -ChildPath $newFileName
    Rename-Item -Path $file.FullName -NewName $newFilePath
    Write-Host "Renamed '$($file.FullName)' to '$newFilePath'"
}
