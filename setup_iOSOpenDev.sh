#!/bin/bash

HOME_IOS_OPEN_DEV="$HOME/Tools/iOS/iOSOpenDev"
HOME_SPECIFICATIONS="$HOME/Tools/iOS/iOSOpenDev/frameworks/Specifications"


ME=$(whoami)

XCODE_IOS_PLATFORM="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform"
XCODE_USR_BIN="$XCODE_IOS_PLATFORM/Developer/usr/bin"
XCODE_SPECIFICATIONS="$XCODE_IOS_PLATFORM/Developer/Library/Xcode/Specifications"
XCODE_SDKSETTINGS="$XCODE_IOS_PLATFORM/Developer/SDKs/iPhoneOS.sdk/SDKSettings.plist"

[ ! -d $XCODE_USR_BIN ] && sudo mkdir -p $XCODE_USR_BIN && sudo chown $ME $XCODE_USR_BIN
sudo ln -fhs $HOME_IOS_OPEN_DEV/bin/iosod $XCODE_USR_BIN && sudo chown -h $ME $XCODE_USR_BIN/iosod
sudo ln -fhs $HOME_IOS_OPEN_DEV/bin/ldid $XCODE_USR_BIN && sudo chown -h $ME $XCODE_USR_BIN/ldid

[ ! -d $XCODE_SPECIFICATIONS ] && sudo mkdir -p $XCODE_SPECIFICATIONS && sudo chown $ME $XCODE_SPECIFICATIONS
sudo cp -rf $HOME_SPECIFICATIONS/*.xcspec $XCODE_SPECIFICATIONS && sudo chown $ME $XCODE_SPECIFICATIONS/*.xcspec

sudo /usr/libexec/PlistBuddy -c 'Set :DefaultProperties:AD_HOC_CODE_SIGNING_ALLOWED "YES"' $XCODE_SDKSETTINGS
sudo /usr/libexec/PlistBuddy -c 'Set :DefaultProperties:CODE_SIGNING_REQUIRED "NO"' $XCODE_SDKSETTINGS
sudo /usr/libexec/PlistBuddy -c 'Set :DefaultProperties:ENTITLEMENTS_REQUIRED "NO"' $XCODE_SDKSETTINGS

# ln -fhs $HOME_IOS_OPEN_DEV/templates $HOME/Library/Developer/Xcode/Templates/iOSOpenDev
