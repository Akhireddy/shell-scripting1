#!/bin/bash

if [ ! -e components/$1.sh ]; then
  echo -e "\e[31m component  is missing \e[0m"
  exit1
fi

bash components/$1.sh