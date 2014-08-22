# Appendix B: Android (Terminal) Installation and Setup

## Environment Requirements
* A Supported OS (Ubuntu 12.10+, OS X 10.7+, Windows 7+)
* Cocos2d-x v3.0 ([HERE](https://github.com/cocos2d/cocos2d-x/ "cocos2d-x"))
* JDK/SDK 1.6+
* NDK r9d+
* Apache Ant
* Python 2.7.5

## Prerequisite 
* Download [cocos2d-x](http://cocos2d-x.org/download) and unzip it. (maybe: ~/) 

* Download JDK, SDK and NDK ([JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html), [SDK](http://developer.android.com/sdk/index.html), [NDK](https://developer.android.com/tools/sdk/ndk/index.html))

* After downloading it, unzip the SDK and NDK to the same root location. (maybe: ~/AndroidDev)

* Verify that `Python 2.7` is installed and is accessible

* Install and verify `Apache Ant` ([Apache.org](http://ant.apache.org/bindownload.cgi))

* Run `setup.py` to configure your Android development environment. This will set the necessary environment variables needed. If you haven't configured this environment before, you will be prompted to enter paths for variables that are not found.

** Caution: You must *not* use the `~` sign. Use the full path to your *home* directory. Otherwise, the scripts will fail due to error path value.

** `*COCOS2D_CONSOLE_ROOT*` environment variable to point to the *bin* directory under *~/cocos2d-x/tools/cocos2d-console* directory.

** `*NDK_ROOT*` environment variable to point to the location of where you put the NDK. (i.e android-ndk-r9d/)

** `*ANDROID_SDK_ROOT*` environment variable to point to the location of where you put the `adt-bundle`.  Example `/Users/guanghui/AndroidDev/adt-bundle-mac-x86_64-20130522/sdk/`. The adt-bundle-mac-x86_64-xxxx, the xxxx number maybe different. So please note this non-trival difference.

** `*ANT_ROOT*` environment variable to point to the location of where you put `apache-ant-x.x.x`.  The `apache-ant-x.x.x`, the x.x.x number maybe different. 

* In your `cocos2d-x` directory run` python setup.py`

* On *nix systems, now issue the following commands:
		
		source ~/.bash_profile

* On win32 systems, close the command line windows and restart it.

## Use `android-build.py` to build cocos2d-x samples

* Change your directory to the where the `android-build.py` script is located. (usually `cocos2d-x/build`)

* execute:
		python android-build.py -p 19 cpp-tests

## How to deploy it on your Android phone via command line

* Enable *[USB Debugging](http://stackoverflow.com/questions/16707137/how-to-find-and-turn-on-usb-debugging-mode-on-nexus-4)* on your phone and then connect your phone via USB.

* Change your directory to the the *bin* directory of your android project

* Use **adb** to install the apk to your android phone:
		adb install TestsDemo-debug.apk


