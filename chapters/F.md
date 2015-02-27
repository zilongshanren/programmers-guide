# Appendix F: Linux Installation and Setup

## Environment Requirements
* Ubuntu 12.10+
* Cocos2d-x v3.3 [https://cocos2d-x.org/download](https://cocos2d-x.org/download "Cocos2d-x")
* CMake 2.6+
* gcc 4.9+

## Prerequisite
Download Cocos2d-x and unzip it. (maybe: ~/)

Install dependencies. The dependencies are:

		libx11-dev
		libxmu-dev
		libglu1-mesa-dev
		libgl2ps-dev
		libxi-dev
		g++
		libzip-dev
		libpng12-dev
		libcurl4-gnutls-dev
		libfontconfig1-dev
		libsqlite3-dev
		libglew*-dev
		libssl-dev

If you are using Ubuntu/Debian, there is a shell script `build/install-deps-linux.sh`
for you to install the dependences easily. Run commands below in terminal:  

    	$ cd $cocos2dx_root/build
    	$ ./install-deps-linux.sh

Otherwise, you should install the dependencies manually.

## Generate Makefile

Run `cmake` to generate `makefile`:

    	$ mkdir linux-build
    	$ cd linux-build
    	$ cmake ../..

When `cmake` returns correctly, many files & folders will be generated in  
`coocs2dx_root/build/linux-build`

![](F-img/1.png "")

## Compile

Run `make` to compile:

    	$ make

Application will be generated in `cocos2dx_root/build/linux-build/bin/cpp-tests/`
if compiled successfully.

## Run

		$ cd bin/cpp-tests/
		$ ./cpp-tests
