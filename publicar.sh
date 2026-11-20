#!/bin/bash
# Regenera a plataforma Linda e publica no GitHub Pages (g3healthservice/dashboard-linda)
set -e
cd "$(dirname "$0")"
python3 gerar_plataforma_linda.py
python3 gerar_modelos_docx.py >/dev/null
cp index.html ~/Downloads/Dashboard_Linda_Municipios.html
# só o que é público: painel, modelos neutros, cartão de compartilhamento, gerador e base (anexos ficam locais)
git add -A modelos && git add index.html og.png .nojekyll README.md
git commit -q -m "Atualiza plataforma Linda ($(date +%F' '%H:%M))

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" || echo "nada a commitar"
git push -q origin main
echo "publicado: https://g3healthservice.github.io/dashboard-linda/"
