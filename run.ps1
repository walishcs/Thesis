param(
    [string]$Action
)

if ($Action -eq "-c") {
    Write-Host "🧹 Cleaning auxiliary files..." -ForegroundColor Yellow
    Remove-Item -Path "main.aux", "main.bbl", "main.bcf", "main.blg", "main.log", "main.out", "main.run.xml", "main.toc", "main.lof", "main.lot", "main.lom" -ErrorAction SilentlyContinue
    Write-Host "✅ Clean complete." -ForegroundColor Green
    Read-Host "Press Enter to continue"
    exit
}

if ($Action -eq "-r") {
    Write-Host "▶ Running xelatex (single pass for -r)..." -ForegroundColor Cyan
    echo "" | xelatex main.tex
    Write-Host "✅ Single run complete." -ForegroundColor Green
    Read-Host "Press Enter to continue"
    exit
}

Write-Host "▶ Running xelatex (1st pass)..." -ForegroundColor Cyan
echo "" | xelatex main.tex

Write-Host "▶ Running biber..." -ForegroundColor Cyan
biber main

Write-Host "▶ Running xelatex (2nd pass)..." -ForegroundColor Cyan
echo "" | xelatex main.tex

Write-Host "▶ Running xelatex (3rd pass)..." -ForegroundColor Cyan
echo "" | xelatex main.tex

Write-Host "▶ Running xelatex (4th pass)..." -ForegroundColor Cyan
echo "" | xelatex main.tex

Write-Host "▶ Running xelatex (5th pass)..." -ForegroundColor Cyan
echo "" | xelatex main.tex

Write-Host "▶ Running xelatex (6th pass)..." -ForegroundColor Cyan
echo "" | xelatex main.tex

Write-Host "✅ All done!" -ForegroundColor Green
Read-Host "Press Enter to continue" 