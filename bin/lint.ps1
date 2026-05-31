#Requires -Version 5.1

$bucketDir = "$PSScriptRoot/../bucket"
$manifests = Get-ChildItem -Path $bucketDir -Filter *.json

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Running Local Scoop Manifest Linter..." -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$hasErrors = $false

foreach ($file in $manifests) {
    Write-Host "Checking: $($file.Name)..." -NoNewline
    $errors = [System.Collections.Generic.List[string]]::new()

    # 1. JSON parsing check
    $jsonText = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $json = $null
    try {
        $json = ConvertFrom-Json -InputObject $jsonText -ErrorAction Stop
    } catch {
        $errors.Add("Invalid JSON syntax: $_")
    }

    if ($null -ne $json) {
        # 2. Indentation check (4 spaces)
        $lines = Get-Content -Path $file.FullName -Encoding UTF8
        $lineNum = 0
        foreach ($line in $lines) {
            $lineNum++
            if ($line -match '^\t+') {
                $errors.Add("Line ${lineNum}: Contains tab characters. Use 4 spaces for indentation instead.")
                break
            }
            if ($line -match '^( +)') {
                $spaces = $Matches[1].Length
                if ($spaces % 4 -ne 0) {
                    $errors.Add("Line ${lineNum}: Indentation is $spaces spaces, which is not a multiple of 4.")
                    break
                }
            }
        }

        # 3. Check required fields
        $requiredFields = @("version", "description", "homepage", "license")
        foreach ($field in $requiredFields) {
            if ([string]::IsNullOrWhiteSpace($json.$field)) {
                $errors.Add("Missing or empty required field: '$field'")
            }
        }

        # 4. Check architecture/url field
        if ($null -eq $json.architecture -and $null -eq $json.url) {
            $errors.Add("Must specify 'architecture' or a top-level 'url'")
        }

        # 5. Check homepage URL format
        if ($null -ne $json.homepage -and $json.homepage -notmatch '^https?://') {
            $errors.Add("Homepage URL must start with http:// or https://")
        }
    }

    if ($errors.Count -gt 0) {
        $hasErrors = $true
        Write-Host " [FAILED]" -ForegroundColor Red
        foreach ($err in $errors) {
            Write-Host "  - $err" -ForegroundColor Red
        }
    } else {
        Write-Host " [PASSED]" -ForegroundColor Green
    }
}

Write-Host "==========================================" -ForegroundColor Cyan
if ($hasErrors) {
    Write-Host "Linter finished with errors. Please fix them before committing." -ForegroundColor Red
    exit 1
} else {
    Write-Host "All manifests look great! Validation passed." -ForegroundColor Green
    exit 0
}
