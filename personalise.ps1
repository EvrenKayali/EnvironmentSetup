$fontsRepo = "https://api.github.com/repos/powerline/fonts/contents/RobotoMono"
$wr = Invoke-WebRequest -Uri $fontsRepo -UseBasicParsing

$objects = $wr.Content | ConvertFrom-Json

$files = $objects | Where-Object {$_.type -eq "file" -and ( $_.download_url.EndsWith(".ttf") -or $_.download_url.EndsWith(".otf"))} | Select-Object -exp download_url

foreach ($file in $files)
{
    Write-Host (Split-Path $file -Leaf)
    $fileDestination = Join-Path $Env:SystemRoot\Fonts (Split-Path $file -Leaf)
    Invoke-WebRequest -Uri $file -OutFile $fileDestination -ErrorAction Stop -Verbose
    "Grabbed '$($file)' to '$fileDestination'"
}

regedit /s font.reg