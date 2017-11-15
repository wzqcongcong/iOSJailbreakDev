# Setup for iOS jailbreak development

##### OS X 10.10+ & Xcode 7+


### Dependency

`brew install ldid dpkg`

---

### Theos

* [Wiki](https://github.com/theos/theos/wiki)

* [Setup](http://iphonedevwiki.net/index.php/Theos/Setup)

---

### iOSOpenDev

[Wiki](https://github.com/kokoabim/iOSOpenDev/wiki)

1. update `.zshrc`

    `export iOSOpenDevPath=path/to/iOSOpenDev`

    `export iOSOpenDevDevice=`

    `export PATH=$iOSOpenDevPath:$PATH`

2. `git clone --recursive https://github.com/kokoabim/iOSOpenDev.git $iOSOpenDevPath`

3. setup *templates*

    this version of *templates* is refined by the original one: the `ShellScript` of `BuildPhases` in `TemplateInfo.plist` is changed to `$iOSOpenDevPath/bin/iosod --xcbp`, and this *[$iOSOpenDevPath]* here is not that in `.zshrc`, it is a user defined key in `Base.xctemplate` and `Empty Project.xctemplate`.

    copy the `templates` into iOSOpenDevPath, then open `TemplateInfo.plist` in `Base.xctemplate` and `Empty Project.xctemplate` with Xcode, then set the value of the user defined key *[iOSOpenDevPath]* to `path/to/iOSOpenDev`.

    `ln -fhs $iOSOpenDevPath/templates ~/Library/Developer/Xcode/Templates/iOSOpenDev`

4. setup *Xcode*

    copy the `Specifications/*.xcspec` files into `/Applications/Xcode/Content/Developer/Platforms/[PLATFORM_PATH]/Developer/Library/Xcode/Specifications`

    `ln -fhs $iOSOpenDevPath/bin/iosod /Applications/Xcode/Content/Developer/Platforms/[PLATFORM_PATH]/Developer/usr/bin`

    `ln -fhs $iOSOpenDevPath/bin/ldid /Applications/Xcode/Content/Developer/Platforms/[PLATFORM_PATH]/Developer/usr/bin`

5. setup *SDK*

    modify the following key/value in `[SDK_PATH]/SDKSettings.plist`:

            `DefaultProperties.CODE_SIGNING_REQUIRED` => "NO"
            `DefaultProperties.ENTITLEMENTS_REQUIRED` => "NO"
            `DefaultProperties.AD_HOC_CODE_SIGNING_ALLOWED` => "YES"

    in Xcode 7.3, the private framework has been removed from iOS 9.3 SDK, so maybe you want to use iOS 9.2 SDK. once you copy iOS 9.2 SDK into `[PLATFORM_PATH]/Developer/SDKs`, you should also modify `[PLATFORM_PATH]/Info.plist` as following, or else Xcode 7.3 can not recognize iOS 9.2 SDK in project build settings:

            `MinimumSDKVersion` => "9.2"
