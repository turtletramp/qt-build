FROM ubuntu:16.04

ARG QT=5.9.3
ARG QTM=5.9
ARG QTSHA=4df4f8e6ccd61f9aa038ad4a6e688412a95de78f8607c4132b8277f05aac24b8
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="qt-build" \
      org.label-schema.description="A headless Qt $QTM build environment for Ubuntu" \
      org.label-schema.url="e.g. https://github.com/turtletramp/qt-build" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.vcs-url="https://github.com/turtletramp/qt-build.git" \
      org.label-schema.version="$QT" \
      org.label-schema.schema-version="1.0"

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
        ant \
        build-essential \
        ca-certificates \
        default-jdk \
        git \
        libfontconfig1 \
        libice6 \
        libgl1-mesa-dev \
        libsm6 \
        libx11-xcb1 \
        libxext6 \
        libxrender1 \
        locales \
        mesa-common-dev \
        openssh-client \
        p7zip \
        xvfb \
    && apt-get clean

ADD http://download.qt.io/official_releases/qt/${QTM}/${QT}/qt-opensource-linux-x64-${QT}.run /tmp/qt/installer.run
ADD qt-installer-noninteractive.qs /tmp/qt/script.qs

RUN echo "${QTSHA}  /tmp/qt/installer.run" | shasum -a 256 -c \
    && chmod +x /tmp/qt/installer.run \
    && xvfb-run /tmp/qt/installer.run --script /tmp/qt/script.qs \
     | egrep -v '\[[0-9]+\] Warning: (Unsupported screen format)|((QPainter|QWidget))' \
    && rm -rf /tmp/qt

RUN echo /opt/qt/${QTM}/gcc_64/lib > /etc/ld.so.conf.d/qt-${QTM}.conf
RUN locale-gen en_US.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

ENV QT_BASE_DIR=/opt/qt/${QT}/gcc_64
ENV QTDIR=$QT_BASE_DIR 
ENV PATH=$QT_BASE_DIR/bin:$PATH 
ENV LD_LIBRARY_PATH=$QT_BASE_DIR/lib/x86_64-linux-gnu:$QT_BASE_DIR/lib:$LD_LIBRARY_PATH 
ENV PKG_CONFIG_PATH=$QT_BASE_DIR/lib/pkgconfig:$PKG_CONFIG_PATH

RUN gcc -v
RUN g++ -v
RUN make -v
RUN qmake -v
