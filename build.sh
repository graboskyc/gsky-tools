#!/bin/bash

echo
echo "+======================"
echo "| START: Tools"
echo "+======================"
echo

docker build -t graboskyc/gsky-tools:latest .

echo "Run me like"
echo -e "\t docker run --rm -it graboskyc/gsky-tools command"

echo
echo "+======================"
echo "| END: Tools"
echo "+======================"
echo