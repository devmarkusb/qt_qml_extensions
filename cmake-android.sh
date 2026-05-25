#!/usr/bin/env bash

set -euo pipefail

usage() {
    cat <<'EOF'
Usage:
  ./cmake-android.sh [Debug|Release|RelWithDebInfo] [keystore_path] [key_pass] [store_pass]

Environment overrides:
  ANDROID_NDK_VERSION              default: 28.0.13004108
  ANDROID_SDK_ROOT or ANDROID_HOME Android SDK path
  DEV_SDK_PATH or dev_sdk_path     local SDK root used to derive Android/Qt paths
  QT_ANDROID_ABIS                  default: arm64-v8a
  QT_ANDROID_ARCH                  default: android_arm64_v8a
  QT_ANDROID_KEYSTORE_ALIAS        default: key
  QT_ANDROID_KEYSTORE_*            signing values; args override path/key/store pass
  QT_ANDROID_PACKAGE_NAME          default: org.cismypa.qt_qml_extensions_testapp
  QT_ANDROID_TARGET_SDK_VERSION    default: 35
  QT_ANDROID_MIN_SDK_VERSION       default: 21
  QT_ANDROID_VERSION_CODE          default: 1
  QT_ANDROID_VERSION_NAME          default: 1
  QT_HOST_PATH                     host Qt path, for example /opt/Qt/6.9.3/gcc_64
  QT_VERSION                       default: 6.9.3
EOF
}

build_config="${1:-Release}"
if [ "$build_config" = "-h" ] || [ "$build_config" = "--help" ]; then
    usage
    exit 0
fi

case "$build_config" in
    Debug|Release|RelWithDebInfo) ;;
    *)
        echo "Unsupported build config: $build_config" >&2
        usage >&2
        exit 1
        ;;
esac

subdir_lowercase="$(printf '%s' "$build_config" | tr '[:upper:]' '[:lower:]')"
build_dir="cmake-build-android-$subdir_lowercase"

qt_version="${QT_VERSION:-6.9.3}"
qt_android_arch="${QT_ANDROID_ARCH:-android_arm64_v8a}"
qt_android_abis="${QT_ANDROID_ABIS:-arm64-v8a}"
android_ndk_version="${ANDROID_NDK_VERSION:-28.0.13004108}"
android_target_sdk="${QT_ANDROID_TARGET_SDK_VERSION:-35}"
android_min_sdk="${QT_ANDROID_MIN_SDK_VERSION:-21}"
package_name="${QT_ANDROID_PACKAGE_NAME:-org.cismypa.qt_qml_extensions_testapp}"
version_code="${QT_ANDROID_VERSION_CODE:-1}"
version_name="${QT_ANDROID_VERSION_NAME:-1}"

legacy_dev_sdk_path="${dev_sdk_path:-}"
dev_sdk_root="${DEV_SDK_PATH:-$legacy_dev_sdk_path}"
android_sdk_root="${ANDROID_SDK_ROOT:-${ANDROID_HOME:-}}"
if [ -z "$android_sdk_root" ] && [ -n "$dev_sdk_root" ]; then
    android_sdk_root="$dev_sdk_root/Android/Sdk"
fi
if [ -z "$android_sdk_root" ]; then
    echo "Set ANDROID_SDK_ROOT, ANDROID_HOME, DEV_SDK_PATH, or dev_sdk_path." >&2
    exit 1
fi

android_ndk_root="${ANDROID_NDK_ROOT:-$android_sdk_root/ndk/$android_ndk_version}"
if [ ! -d "$android_ndk_root" ]; then
    echo "Android NDK not found at: $android_ndk_root" >&2
    exit 1
fi

qt_android_root="${QT_ANDROID_ROOT:-}"
qt_host_path="${QT_HOST_PATH:-}"
if [ -z "$qt_android_root" ] && [ -n "$dev_sdk_root" ]; then
    qt_android_root="$dev_sdk_root/qt_linux/$qt_version/$qt_android_arch"
fi
if [ -z "$qt_host_path" ] && [ -n "$dev_sdk_root" ]; then
    qt_host_path="$dev_sdk_root/qt_linux/$qt_version/gcc_64"
fi
if [ -z "$qt_android_root" ] || [ -z "$qt_host_path" ]; then
    echo "Set QT_ANDROID_ROOT and QT_HOST_PATH, or set DEV_SDK_PATH/dev_sdk_path." >&2
    exit 1
fi

sign_key_path="${2:-${QT_ANDROID_KEYSTORE_PATH:-}}"
sign_key_pass="${3:-${QT_ANDROID_KEYSTORE_KEY_PASS:-}}"
sign_store_pass="${4:-${QT_ANDROID_KEYSTORE_STORE_PASS:-}}"
sign_key_alias="${QT_ANDROID_KEYSTORE_ALIAS:-key}"

for required in "$sign_key_path" "$sign_key_pass" "$sign_store_pass"; do
    if [ -z "$required" ]; then
        echo "Keystore path, key password, and store password are required for signed AAB builds." >&2
        usage >&2
        exit 1
    fi
done
if [ ! -f "$sign_key_path" ]; then
    echo "Keystore not found at: $sign_key_path" >&2
    exit 1
fi

export QT_ANDROID_KEYSTORE_ALIAS="$sign_key_alias"
export QT_ANDROID_KEYSTORE_KEY_PASS="$sign_key_pass"
export QT_ANDROID_KEYSTORE_PATH="$sign_key_path"
export QT_ANDROID_KEYSTORE_STORE_PASS="$sign_store_pass"

"$qt_android_root/bin/qt-cmake" \
    -S . \
    -B "$build_dir" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE="$build_config" \
    -DCMAKE_CXX_STANDARD=26 \
    -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES=./devenv/cmake/fetch-content-from-lockfile.cmake \
    -DANDROID_NDK_ROOT="$android_ndk_root" \
    -DANDROID_SDK_ROOT="$android_sdk_root" \
    -DMB_UL_DEPLOYMENT_BUILD=ON \
    -DQT_ANDROID_ABIS="$qt_android_abis" \
    -DQT_ANDROID_MIN_SDK_VERSION="$android_min_sdk" \
    -DQT_ANDROID_PACKAGE_NAME="$package_name" \
    -DQT_ANDROID_SIGN_AAB=TRUE \
    -DQT_ANDROID_TARGET_SDK_VERSION="$android_target_sdk" \
    -DQT_ANDROID_VERSION_CODE="$version_code" \
    -DQT_ANDROID_VERSION_NAME="$version_name" \
    -DQT_HOST_PATH="$qt_host_path" \
    -DUL_DEPLOYMENT_BUILD=ON

cmake --build "$build_dir" --target aab
