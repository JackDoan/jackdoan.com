#!/bin/bash

SRC_PATH="./assets/src"
HEADER="$SRC_PATH/head.html"
FOOTER="$SRC_PATH/foot.html"

__do_page () {
	local OUT_BASE=$1
	local OUT="$1.html"
  local TITLE=$2
	local ACTIVE=$3
	echo Building $OUT
  rm -f $OUT
  cat $HEADER $SRC_PATH/"$OUT_BASE"_content.html $FOOTER > $OUT
  sed -i s/"$ACTIVE"_ACTIVE/active/g $OUT
  sed -i s/TITLE/"$TITLE"/g $OUT

}

do_page () {
	__do_page $1 "Jack Doan - $2" "PROJECTS"
}

__do_page index "Jack Doan" "HOME"

do_page blender "The Blender"
do_page comex "Comet Exoskeleton"
do_page scpi "SCPI Tutorial"
do_page ll120 "Corsair LL120 Fans - Teardown and Reverse Engineering"
