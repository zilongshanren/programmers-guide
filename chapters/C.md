# Appendix C: Android (Eclipse) Installation and Setup

## Prerequisite
* Complete steps in Appendix A

* Eclipse ADT Bundle [http://developer.android.com/sdk/index.html](http://developer.android.com/sdk/index.html)

## Open the proj.android project with Eclipse.

* Launch Eclipse

* Right click your mouse at the empty area of the `Package Explorer` and choose
`Import...`.

* Choose `Existing Android Code Into Workspace` from the pop up dialog and Click
`Next`.

![](C-img/image2.png)

* Click the `Browse...` button to choose the directory of Cpp-Tests' `proj.android`
and Click Ok.

![](C-img/image3.png)

* Click Finish.

## Import Libcocos2dx Project
* Same steps as above only using the path of the libcocos2dx project is
`[your own game project folder]/cocos/2d/platform/android/java`.

![](C-img/image5.png)

## Build and Run the Android Project
* Connect your Android phone with `USB remote debugging` option enabled.

* Make sure your computer can recognize your phone (you might need to install
drivers for your specific phone)

* Right click on the project and choose `Run as...` -> `Android Application`.

![](C-img/image6.png)
