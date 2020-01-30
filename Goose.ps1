$zipDownload = "https://docs.google.com/uc?export=download&id=1N5X3SEnACFLwj7eyfSgSV6t26I8VCBpX"
$tempPath = "c:\temp\Goose" 
$temp = "$tempPath\Goose.zip"
New-Item $tempPath -ItemType Directory -Force
Invoke-WebRequest -Uri $zipDownload -OutFile $temp
Expand-Archive -Path $temp -DestinationPath $tempPath -Force
$goose = Get-ChildItem $tempPath -Recurse -Filter "GooseDesktop.exe"
Get-Process *goose* | Stop-Process
Start-Process $goose.FullName