#!/bin/bash

echo "============================" && \
echo "Let's build this thing then!" && \
echo "============================" && \
echo "" && \

echo "1. Elm" && \
  elm package install -y && \

echo "2. npm" && \
  npm install && \

echo "3. bower" && \
  bower install && \

echo "4. Run the build" && \
  NODE_ENV=production npm run build && \

echo "5. Run the imports through minification" && \
  mkdir -p tmp && \
  cp dist/imports.html dist/imports.js tmp && \
echo "  a) HTML" && \
  ./node_modules/html-minifier/cli.js \
    -c ./config/html-minifier.json \
    ./tmp/imports.html -o ./dist/imports.html
echo "  b) JS" && \
  ./node_modules/.bin/uglifyjs \
    --compress --mangle -o ./dist/imports.js \
    ./tmp/imports.js && \

echo "============================" && \
echo "All done!                   " && \
echo "============================" && \
echo ""
