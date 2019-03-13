#This script will generate libpjsua2.so for the given architecture, as well as .java files for JNI interface
# first create the outer dirs
# - android -> app -> src -> main -> jniLibs
# - android -> app -> src -> main -> java
# then create the default build for armeabi
# copy the libpjsua2.so to jniLibs/armeabi
# copy the *.java files to java/*.*
# then -
# for each architecture armeabi, armeabi-v7a, arm64-v8a, x86, x86_64, mips64
# -build libpjsua.so and copy to android -> app -> src -> main -> jniLibs -> <it's respective folder>
#
make distclean 2>&1
make clean 2>&1
make realclean 2>&1
find . -name "*.depend" -exec rm {} \;

echo "TARGET_ABI = $1"
NDK_TOOLCHAIN_VERSION=4.9 TARGET_ABI=$1 APP_PLATFORM=android-28 ./configure-android --use-ndk-cflags

# this generates the default armeabi shared library and can be used to generate
# the jni bindings which will then be copied. Only the bindings from this build set will be copied
make dep 2>&1
make 2>&1

# generate the shared library (libpjsua.so) which will then be used to generate the java/jni bindings (.java files)

cd pjsip-apps/src/swig
make clean 2>&1
make TARGET_ABI=$1 2>&1

#copy java files and shared library file to path?
