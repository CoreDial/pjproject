cd pjproject

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
