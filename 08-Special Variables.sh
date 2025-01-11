#!/bin/bash

echo "All variables passed: $@"
echo "Number of Variables: $#"
echo "Script name: $0"
echo "Present Working Directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is running the scripts: $USER"
echo "Process id of current script: $$"
sleep 100 &
echo "Process id of last command in background: $!"