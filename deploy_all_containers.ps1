# Simple PSS that deploys all containers at once.

$root = "E:\Docker" # Amend this to match deployment location for docker containers

$yamls = Get-ChildItem $root -Recurse -Depth 1 -File -Include *.yml, *.yaml

foreach ($file in $yamls) {

    Write-Host "--------------------------------"
    Write-Host "Deploying $($file.FullName)"
    Write-Host "--------------------------------"

    $dir = $file.DirectoryName
    $name = $file.Name

    Push-Location $dir

    try {
        docker compose -f $name up -d
        Write-Host "SUCCESS: $name deployed" -ForegroundColor Green
    }
    catch {
        Write-Host "FAILED: $name" -ForegroundColor Red
    }

    Pop-Location
}