#!/bin/bash -e

npm install -g lineman

lineman new my-app
cd my-app

npm install --save-dev lineman-spec-browser

cd node_modules
rm -rf lineman-spec-browser #<-- lol this is slow i should learn sed
ln -s ../../ lineman-spec-browser
cd ..

mkdir spec-browser
echo "describe '/', ->
  When -> browser.visit('')
  Then -> browser.hasTextOnPage('Hello, World!')
" > spec-browser/hello-world-spec.coffee

BROWSER=PhantomJS lineman grunt specBrowser

cd ..
rm -rf my-app
