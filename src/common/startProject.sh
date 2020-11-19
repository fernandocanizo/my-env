#!/bin/bash

function startProject {
  git init
  # this command doesn't work like this, it always brings a menu
  #npx license $(npm get init.license) -o "$(npm get init.author.name)" > LICENSE
  npx license
  echo 'node_modules/' >> .gitignore
  npm init -y
  git add .
  git commit -m "Start project"
}
