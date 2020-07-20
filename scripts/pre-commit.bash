#!/usr/bin/env bash

echo "Running pre-commit hooks"

./scripts/lint.bash

# $? stores exit value of the last command

if [ $? -ne 0 ]; then

     echo "Code must be clean before commiting"

     exit 1

fi
