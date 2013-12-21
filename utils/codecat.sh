#!/bin/bash
# Filename          catc
# Description       print files to stdout with syntax highlighting (using python-pygments)
# Author            Drew Fradette <http://www.github.com/drewfradette>
# Version           0.6
# Last Updated      2012-09-26
# Usage             catc file.sh
# bash_version      4.2.10(1)-release
#######################################################

PYGMENTIZE=/usr/local/bin/pygmentize
CAT=/bin/cat

help() {
    echo -e "Usage: catc [-h] [-l LEXER] [-L] FILENAME\n"
    echo -e "-h\tDisplay this help screen."
    echo -e "-l\tSpecify a lexer to use. See -L."
    echo -e "-L\tList available lexer.s"
    echo -e "-v\tBe verbose where possible."
}

# Check if python-pygments is installed
# TODO: add support for Ubuntu
if [ ! -f "$PYGMENTIZE" ]; then
  if [ -f /etc/redhat-release ]; then
      while true; do
        read -p "Pygmentize was not found. Would you like to install it? [y/n] " yn
        case $yn in
          [Yy]* ) sudo yum install python-pygments; break;;
          [Nn]* ) exit;;
          * ) echo "Please Answer Yes or No";;
        esac
      done
  else
      echo -e "Error: pygments was not found. Please install it"
      exit 1
  fi
fi

LEXER=""
VERBOSE=0
while getopts "hvLl:" OPTION; do
    case $OPTION in
        h) help; exit;;
        l) LEXER="$OPTARG";;
        L) ${PYGMENTIZE} -L; exit;;
        v) VERBOSE=1;;
        *) echo "Bad parameter"; exit 2;;
    esac
done

shift $((OPTIND-1))
FILENAME="$@"
if [ "$FILENAME" == "" ]; then
    echo -e "You must specify a filename."
    help; exit 3;
fi

if [ "$LEXER" != "" ]; then
    ${PYGMENTIZE} -l "$LEXER" "$FILENAME" 2> /dev/null
else
    ${PYGMENTIZE} "$FILENAME" 2> /dev/null
fi

if (( $? > 0 )); then
    ${CAT} "$1" || exit $?
fi
