#!/bin/bash

echo "Building a static version of the site"

set -e

# Get directory of current file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ -e ${DIR}/bin/tutorial_web ]
then
  ${DIR}/bin/tutorial_web build -s ${DIR}/bin/static -i ${DIR}/courses -o ${DIR}/build
else
  echo "It doesn't look like 'tutorial_web' is installed in the bin directory"
  echo "Running install script"
  echo "======================"
  /usr/bin/env python3 ${DIR}/install.py

  echo "=========================================="
  echo "Now re-run this script to build the website"
fi
