@echo off
chcp 65001 >nul

if "%1"=="-c" (
  echo [CLEAN] Cleaning auxiliary files...
  del /f /q main.aux main.bbl main.bcf main.blg main.log main.out main.run.xml main.toc main.lof main.lot main.lom 2>nul
  echo [DONE] Clean complete.
  pause
  exit /b
)

if "%1"=="-r" (
  echo [RUN] Running xelatex single pass...
  echo "" | xelatex main.tex
  echo [DONE] Single run complete.
  pause
  exit /b
)

echo [RUN] Running xelatex 1st pass...
echo "" | xelatex main.tex

echo [RUN] Running biber...
biber main

echo [RUN] Running xelatex 2nd pass...
echo "" | xelatex main.tex

echo [RUN] Running xelatex 3rd pass...
echo "" | xelatex main.tex

echo [RUN] Running xelatex 4th pass...
echo "" | xelatex main.tex

echo [RUN] Running xelatex 5th pass...
echo "" | xelatex main.tex

echo [RUN] Running xelatex 6th pass...
echo "" | xelatex main.tex

echo [DONE] All done!
pause