#!/bin/sh

# -----ビルド～ipaファイル作成-----

#SDK
SDK="iphoneos10.0"

# Configuration名
CONFIGURATION="Release_ENCRYPTED"

# Xcodeのプロジェクト名
PROJ_FILE_PATH="SampleApp20161020.xcodeproj"

# ターゲット名
TARGET_NAME="SampleApp20161020"

# プロダクト名 
PRODUCT_NAME="SampleApp20161020"

# app出力先ディレクトリ
APP_DIR="app"

# ipa出力先ディレクトリ
IPA_DIR="build"

# プロビジョニングプロファイル
PROVISIONING_PATH="~/Library/MobileDevice/Provisioning\ Profiles/SampleApp20161020_AdHoc.mobileprovision"

# 出力先ディレクトリ作成
rm -rf "${APP_DIR}"
rm -rf "${IPA_DIR}"
mkdir "${APP_DIR}"
mkdir "${IPA_DIR}"

# クリーン
xcodebuild clean -project "${PROJ_FILE_PATH}"

# ビルド
xcodebuild -project "${PROJ_FILE_PATH}" -sdk "${SDK}" -configuration "${CONFIGURATION}" -target "${TARGET_NAME}" install DSTROOT="${APP_DIR}"

# ipaファイル作成
xcrun -sdk "${SDK}" PackageApplication "${PWD}/${APP_DIR}/Applications/${PRODUCT_NAME}.app" -o "${PWD}/${IPA_DIR}/${PRODUCT_NAME}.ipa" -embed "${PROVISIONING_PATH}"