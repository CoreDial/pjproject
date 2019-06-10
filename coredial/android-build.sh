#!/bin/bash
cwd=`pwd`
mydir=`basename $cwd`
if [ "$mydir" = "coredial" ]; then
   cd ..
fi
if [ ! -f "./android-build.sh" ]; then
   echo "Cannot find android-build.sh make sure you are in the pjproject or coredial directory"
   exit 1
fi

./android-build.sh armeabi-v7a

./android-build.sh arm64-v8a

./android-build.sh mips64

./android-build.sh x86

./android-build.sh x86_64

./android-build.sh armeabi
