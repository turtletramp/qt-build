# qt-build

A headless [Qt] 5.9.3 build environment for Ubuntu, tested with
[16.04 LTS (Xenial Xerus)][xenial].

[![](https://images.microbadger.com/badges/image/garthk/qt-build.svg)](https://microbadger.com/images/garthk/qt-build "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/garthk/qt-build.svg)](https://microbadger.com/images/garthk/qt-build "Get your own version badge on microbadger.com")

## Usage

* make
* `docker run -t -i --rm -v $PWD:$PWD qt-build:xenial-5.9.3-1 bash`
* `qmake` in the container

## Selected Components

* `qt.593.gcc_64`
* `qt.593.clang_64`
* `qt.593.android_armv7`
* `qt.593.qtvirtualkeyboard`
* `qt.593.qtwebengine`

Edit `qt-installer-noninteractive.qs` and build your own image to add more.

## Credits

* [Xian Nox][xiannox] for the Qt 5.7-beta image
* Garth Kidd [https://github.com/garthk/qt-build] from which this is a fork from

[Qt]: https://www.qt.io
[xenial]: http://releases.ubuntu.com/16.04/
[xiannox]: https://hub.docker.com/u/xiannox
