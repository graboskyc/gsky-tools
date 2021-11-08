#!/bin/bash

echo
echo "+======================"
echo "| START: Tools"
echo "+======================"
echo

docker build -t graboskyc/gsky-tools:slim .

echo "Run me like"
echo -e "\t docker run --rm -it graboskyc/gsky-tools:slim command"

echo
echo "+======================"
echo "| END: Tools"
echo "+======================"
echo