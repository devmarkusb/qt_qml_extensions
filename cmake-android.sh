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
build_dir=cmake-build-android-$subdir_lowercase

mkdir -p $build_dir

cd $build_dir || exit

sdk_path=$dev_sdk_path/Android/Sdk
ndk_path=$sdk_path/ndk/28.0.13004108
qt_version=6.9.3

export QT_ANDROID_KEYSTORE_PATH=$sign_key_path
export QT_ANDROID_KEYSTORE_ALIAS=key
export QT_ANDROID_KEYSTORE_STORE_PASS=Q6KHNhs8tAFsPiYgbpoxo9FXfcQENzvu
export QT_ANDROID_KEYSTORE_KEY_PASS=$sign_key_pass

#    -DQT_CHAINLOAD_TOOLCHAIN_FILE=$ndk_path/build/cmake/android.toolchain.cmake \
#    -DQT_ANDROID_SDK_BUILD_TOOLS_REVISION=36 \
#    -DQT_ANDROID_ABIS="arm64-v8a,armeabi-v7a,x86,x86_64" \
#    -DQT_ANDROID_BUILD_ALL_ABIS=TRUE \
#    -DQT_ANDROID_MULTI_ABI_FORWARD_VARS=CMAKE_BUILD_TYPE \

# set
#-DUL_DEPLOYMENT_BUILD=ON \
# below for deployment build
# subdirs: android_arm64_v8a,android_armv7,android_x86,android_x86_64
$dev_sdk_path/qt_linux/$qt_version/android_arm64_v8a/bin/qt-cmake \
    -DCMAKE_BUILD_TYPE=$build_config \
    -DQT_ANDROID_TARGET_SDK_VERSION=35 \
    -DQT_ANDROID_MIN_SDK_VERSION=21 \
    -DANDROID_SDK_ROOT=$sdk_path \
    -DANDROID_NDK_ROOT=$ndk_path \
    -DQT_HOST_PATH=$dev_sdk_path/qt_linux/$qt_version/gcc_64 \
    -DQT_ANDROID_SIGN_AAB=True \
    -DQT_ANDROID_PACKAGE_NAME=org.cismypa.qt_qml_extensions_testapp \
    -DQT_ANDROID_VERSION_CODE=1 \
    -DQT_ANDROID_VERSION_NAME=1 \
    -DUL_DEPLOYMENT_BUILD=ON \
    -S .. -B . \
    -G Ninja

pwd
cmake --build . --verbose --target aab

cd ..
