FROM archlinux:base-devel

ARG NDK_VERSION=r23b \
    SDK_VERSION=8512546_latest \
    JAVA_VERSION=jdk17-openjdk \
    NDKAPI=27 \
    ANDROIDAPI=27

LABEL maintainer="yencardonaal@unal.edu.co" \
      version="1.1"

RUN pacman --noconfirm -Suy \
    && pacman --noconfirm -S vim wget zip unzip ${JAVA_VERSION} python python-pip \
    && pip install python-for-android cython

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
    && ./sdkmanager "build-tools;27.0.3" \
    && ./sdkmanager "system-images;android-27;default;arm64-v8a" \
    && ./sdkmanager "platforms;android-27"

ENV ANDROIDNDK=/app/android/ndk/android-ndk-r23b \
    ANDROIDSDK=/app/android/sdk \
    NDKAPI=27 \
    ANDROIDAPI=27

WORKDIR /app/env
CMD ["/usr/bin/bash"]
