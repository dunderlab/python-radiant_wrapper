FROM --platform=linux/amd64 archlinux:base-devel

LABEL image="dunderlab/radiant_p4a" \
      version="1.1" \
      maintainer="yencardonaal@unal.edu.co" \
      description="" \
      project="" \
      documentation="" \
      license="BSD 2-Clause"

ARG NDK_VERSION=r28c \
    SDK_VERSION=13114758_latest \
    JAVA_VERSION=jdk17-openjdk \
    NDKAPI=35 \
    ANDROIDAPI=35 \
    BUILDTOOL=35.0.0 \
    P4A_VERSION=2024.1.21 \
    CYTHON_VERSION=3.0.4

RUN pacman --noconfirm -Suy \
    && pacman --noconfirm -S vim wget zip unzip ${JAVA_VERSION} python python-pip \
    && archlinux-java set java-17-openjdk \
    && pip install --break-system-packages python-for-android==${P4A_VERSION} cython==${CYTHON_VERSION}

WORKDIR /app/android
RUN wget -c https://dl.google.com/android/repository/android-ndk-${NDK_VERSION}-linux.zip \
    && unzip android-ndk-${NDK_VERSION}-linux.zip -d ndk \
    && rm android-ndk-${NDK_VERSION}-linux.zip \
    && wget -c https://dl.google.com/android/repository/commandlinetools-linux-${SDK_VERSION}.zip \
    && unzip commandlinetools-linux-${SDK_VERSION}.zip -d sdk \
    && rm commandlinetools-linux-${SDK_VERSION}.zip \
    && mv sdk/cmdline-tools/ sdk/latest \
    && mkdir sdk/cmdline-tools \
    && mv sdk/latest sdk/cmdline-tools

WORKDIR /app/android/sdk/cmdline-tools/latest/bin/
RUN yes | ./sdkmanager --licenses \
    && ./sdkmanager "build-tools;${BUILDTOOL}" \
    && ./sdkmanager "system-images;android-${ANDROIDAPI};default;arm64-v8a" \
    && ./sdkmanager "platforms;android-${ANDROIDAPI}"

ENV ANDROIDNDK=/app/android/ndk/android-ndk-${NDK_VERSION} \
    ANDROIDSDK=/app/android/sdk \
    NDKAPI=${NDKAPI} \
    ANDROIDAPI=${ANDROIDAPI}

WORKDIR /app/env
CMD ["/usr/bin/bash"]
