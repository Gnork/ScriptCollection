#!/bin/bash
# 
# Description:
#	This script reduces the size of pdf files
# Usage: 
#	$ bash CompressPDF.sh input.pdf
# Author:
#	process91 @ ubuntuforums.org
#	http://ubuntuforums.org/showthread.php?t=1133357&page=2&p=9009756#post9009756
#	All credits to the author!
#
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${1%\.pdf}-small.pdf $1
