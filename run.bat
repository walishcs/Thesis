@echo off

if "%1"=="-c" (
  echo 🧹 Cleaning auxiliary files...
  del /f /q main.aux main.bbl main.bcf main.blg main.log main.out main.run.xml main.toc main.lof main.lot main.lom
  echo ✅ Clean complete.
  pause
  exit /b
)

REM 如果是 -r 參數，只跑一次 xelatex
if "%1"=="-r" (
  echo ▶ Running xelatex (single pass for -r)...
  echo. | xelatex main.tex
  echo ✅ Single run complete.
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

echo ▶ Running xelatex (4th pass)...
echo. | xelatex main.tex

echo ▶ Running xelatex (5th pass)...
echo. | xelatex main.tex

echo ▶ Running xelatex (6th pass)...
echo. | xelatex main.tex

echo ✅ All done!
pause