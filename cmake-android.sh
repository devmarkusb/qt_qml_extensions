#!/usr/bin/env bash

set -x

if [ -z "$1" ]
then
    echo "You need to pass Debug or Release as parameter, then path to signing key file, then pass."
    exit
fi

echo "Hint: you might want to delete cmake-build-debug/release dir(s) for clean cmake run first"

build_config=$1
sign_key_path=$2
sign_key_pass=$3
subdir_lowercase=${1,,}
build_dir=_build-$subdir_lowercase-android

# Uncomment arm/x86 blocks according to your needs.
# Typically arm is more popular for deployments. And x86 is the only convenient (performance-wise) build
# to be tested within an emulator on a desktop computer.
# Look for the call to add_qt_android_apk in CMakeLists.txt for further important instructions concerning
# deployment builds.

# set
#-DUL_DEPLOYMENT_BUILD=ON \
# below for deployment build

### x86 ###
# Note, you might need to rename (copy) some subdirs in your NDK.

mkdir -p $build_dir

cd $build_dir || exit

ndk_path=$dev_sdk_path/Android/Sdk/ndk/21.3.6528147

cmake \
-G "Unix Makefiles" \
-DCMAKE_BUILD_TYPE=$build_config \
-DUL_DEPLOYMENT_BUILD=OFF \
-DCMAKE_TOOLCHAIN_FILE=$ndk_path/build/cmake/android.toolchain.cmake \
-DUL_JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 \
-DUL_ANDROID_NDK=$ndk_path \
-DANDROID_STL="c++_shared" \
-DANDROID_ABI="arm64-v8a" \
-DANDROID_PLATFORM=28 \
-DUL_ANDROID_SIGN_KEY_PATH=$sign_key_path \
-DUL_ANDROID_SIGN_KEY_PASS=$sign_key_pass \
-DUL_QT5_VERSION=5.15.2 \
-DUL_QT_COMPILER_SUBDIR=android \
-DUL_FORCE_TESTAPP=ON \
.. -Wno-deprecated

cd ..
cmake --build $build_dir
