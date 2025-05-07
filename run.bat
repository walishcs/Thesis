@echo off

if "%1"=="--clean" (
  echo 🧹 Cleaning auxiliary files...
  del /f /q main.aux main.bbl main.bcf main.blg main.log main.out main.run.xml main.toc main.lof main.lot main.lom
  echo ✅ Clean complete.
  pause
  exit /b
)

echo ▶ Running xelatex (1st pass)...
echo. | xelatex main.tex

echo ▶ Running biber...
biber main

echo ▶ Running xelatex (2nd pass)...
echo. | xelatex main.tex

echo ▶ Running xelatex (3rd pass)...
echo. | xelatex main.tex

echo ✅ All done!
pause