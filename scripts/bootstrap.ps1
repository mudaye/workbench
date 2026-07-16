# Workbench Repository Bootstrap
# Creates the repository directory structure.
# Safe to run multiple times.

$ErrorActionPreference = "Stop"

$directories = @(
    "docs",
    "docs\adr",
    "docs\architecture",
    "docs\diagrams",
    "docs\experiments",

    "platform",
    "platform\local",
    "platform\infrastructure",
    "platform\deployment",
    "platform\observability",
    "platform\security",

    "applications",
    "applications\frontend",
    "applications\backend",
    "applications\mobile",
    "applications\ai",

    "services",

    "libraries",

    "contracts",

    "testing",
    "testing\unit",
    "testing\integration",
    "testing\contract",
    "testing\e2e",
    "testing\performance",

    "scripts",

    "tools",

    "examples",

    ".github"
)

$files = @(
    "README.md",
    "LICENSE",

    "docs\project-documentation.md",
    "docs\engineering-portfolio.md",
    "docs\engineering-cookbook.md"
)

Write-Host ""
Write-Host "Bootstrapping Workbench repository..."
Write-Host ""

foreach ($dir in $directories) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
        Write-Host "Created directory: $dir"
    }
    else {
        Write-Host "Exists: $dir"
    }
}

foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        New-Item -ItemType File -Path $file | Out-Null
        Write-Host "Created file: $file"
    }
    else {
        Write-Host "Exists: $file"
    }
}

Write-Host ""
Write-Host "Workbench repository bootstrap complete."
