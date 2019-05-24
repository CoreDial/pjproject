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
mkdir ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/armeabi-v7a
mv ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/armeabi/libpjsua2.so ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/armeabi-v7a/

./android-build.sh arm64-v8a
mkdir ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/arm64-v8a
mv ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/armeabi/libpjsua2.so ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/arm64-v8a/

./android-build.sh mips64
mkdir ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/mips64
mv ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/armeabi/libpjsua2.so ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/mips64/

./android-build.sh x86
mkdir ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/x86
mv ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/armeabi/libpjsua2.so ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/x86/

./android-build.sh x86_64
mkdir ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/x86_64
mv ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/armeabi/libpjsua2.so ./pjsip-apps/src/swig/java/android/app/src/main/jniLibs/x86_64/

./android-build.sh armeabi
