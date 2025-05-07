#!/bin/bash

# 自動清除 aux 檔案
if [[ "$1" == "-c" ]]; then
    echo "🧹 Cleaning auxiliary files..."
    rm -f main.aux main.bbl main.bcf main.blg main.log main.out main.run.xml main.toc main.lof main.lot main.lom
    echo "✅ Clean complete."
    exit 0
fi

# 新增 -r 參數，若有則多跑一次 xelatex
if [[ "$1" == "-r" ]]; then
    echo "▶️ Running xelatex (single pass for -r)..."
    yes '' | xelatex main.tex
    echo "✅ Single run complete."
    exit 0
fi

echo "▶️ Running xelatex (1st pass)..."
yes '' | xelatex main.tex

echo "▶️ Running biber..."
biber main

echo "▶️ Running xelatex (2nd pass)..."
yes '' | xelatex main.tex

echo "▶️ Running xelatex (3rd pass)..."
yes '' | xelatex main.tex

echo "▶️ Running xelatex (4th pass)..."
yes '' | xelatex main.tex

echo "▶️ Running xelatex (5th pass)..."
yes '' | xelatex main.tex

echo "▶️ Running xelatex (6th pass)..."
yes '' | xelatex main.tex

echo "✅ All done!"