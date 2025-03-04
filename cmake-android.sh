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

# set
#-DUL_DEPLOYMENT_BUILD=ON \
# below for deployment build

mkdir -p $build_dir

cd $build_dir || exit

sdk_path=$dev_sdk_path/Android/Sdk
ndk_path=$sdk_path/ndk/28.0.13004108


#    -DQT_CHAINLOAD_TOOLCHAIN_FILE=$ndk_path/build/cmake/android.toolchain.cmake \
#    -DQT_ANDROID_SDK_BUILD_TOOLS_REVISION=36 \

export QT_ANDROID_KEYSTORE_PATH=$sign_key_path
export QT_ANDROID_KEYSTORE_ALIAS=key
export QT_ANDROID_KEYSTORE_STORE_PASS=Q6KHNhs8tAFsPiYgbpoxo9FXfcQENzvu
export QT_ANDROID_KEYSTORE_KEY_PASS=$sign_key_pass

$dev_sdk_path/qt_linux/6.8.2/android_arm64_v8a/bin/qt-cmake \
    -DCMAKE_BUILD_TYPE=$build_config \
    -DQT_ANDROID_BUILD_ALL_ABIS=TRUE \
    -DANDROID_SDK_ROOT=$sdk_path \
    -DANDROID_NDK_ROOT=$ndk_path \
    -DQT_ANDROID_TARGET_SDK_VERSION=35 \
    -DCMAKE_PREFIX_PATH=$dev_sdk_path/qt_linux/6.8.2/gcc_64 \
    -DQT_ANDROID_SIGN_AAB=True \
    -S .. -B . \
    -G Ninja

pwd
cmake --build . --verbose --target aab

cd ..
