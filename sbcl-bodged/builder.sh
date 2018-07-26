source $stdenv/setup

TARGET_DIR="$out/bin"
RUNNER=$TARGET_DIR/sbcl-bodged
LIB_PATH="$TARGET_DIR/lib:$libPath"

mkdir -p $TARGET_DIR

echo "#!/usr/bin/env sh" >> $RUNNER
echo "export LD_LIBRARY_PATH=\"$LD_LIBRARY_PATH:$LIB_PATH\"" >> $RUNNER
echo "exec \"$sbcl/bin/sbcl\" $@" >> $RUNNER
chmod +x $RUNNER