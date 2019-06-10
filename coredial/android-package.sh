#!/bin/bash
cwd=`pwd`
dirroot=$cwd
mydir=`basename $cwd`
if [ "$mydir" = "coredial" ]; then
   cd ..
   dirroot=`pwd`
fi

mkdir coredial/Android-Output

#Change directories to java project root
cd pjsip-apps/src/swig/java/android/app/src/main
javafiles=`find java/org -name *.java|grep -v '/app/'`
cfiles=`find jniLibs/* -name *.so`

echo "Packaging files..."
zip -r $dirroot/coredial/Android-Output/pjsip-java.zip $cfiles $javafiles
if [ $? -eq 0 ]; then
   echo "Done"
else 
   echo "An error occurred"
fi
