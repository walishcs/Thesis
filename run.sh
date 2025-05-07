#!/bin/bash

if [[ "$1" == "--clean" ]]; then
    echo "🧹 Cleaning auxiliary files..."
    rm -f main.aux main.bbl main.bcf main.blg main.log main.out main.run.xml main.toc main.lof main.lot main.lom
    echo "✅ Clean complete."
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

echo "✅ All done!"