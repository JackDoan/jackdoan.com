#!/bin/bash
HEADER="./assets/src/head.html"
FOOTER="./assets/src/foot.html"
SRC_PATH="./assets/src"


OUT="index.html"
echo Building $OUT
rm $OUT
cat $HEADER $SRC_PATH/index_content.html $FOOTER > $OUT
sed -i 's/HOME_ACTIVE/active/g' $OUT
sed -i 's/TITLE/Jack Doan/g' $OUT

OUT="blender.html"
echo Building $OUT
rm $OUT
cat $HEADER $SRC_PATH/blender_content.html $FOOTER > $OUT
sed -i 's/PROJECTS_ACTIVE/active/g' $OUT
sed -i 's/TITLE/Jack Doan - The Blender/g' $OUT

OUT="comex.html"
echo Building $OUT
rm $OUT
cat $HEADER $SRC_PATH/comex_content.html $FOOTER > $OUT
sed -i 's/PROJECTS_ACTIVE/active/g' $OUT
sed -i 's/TITLE/Jack Doan - Comet Exoskeleton/g' $OUT

OUT="scpi.html"
echo Building $OUT
rm $OUT
cat $HEADER $SRC_PATH/scpi_content.html $FOOTER > $OUT
sed -i 's/PROJECTS_ACTIVE/active/g' $OUT
sed -i 's/TITLE/Jack Doan - SCPI Tutorial/g' $OUT
