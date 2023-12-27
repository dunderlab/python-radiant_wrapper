FROM archlinux:base-devel

LABEL image="dunderlab/radiant_p4a"
LABEL version="1.0"
LABEL maintainer="yencardonaal@unal.edu.co"
LABEL description=""
LABEL project=""
LABEL documentation=""
LABEL license="BSD 2-Clause"

ARG NDK_VERSION=r26b \
    SDK_VERSION=10406996_latest \
    JAVA_VERSION=jdk17-openjdk \
    NDKAPI=30 \
    ANDROIDAPI=30 \
    BUILDTOOL='34.0.0'

LABEL maintainer="yencardonaal@unal.edu.co" \
      version="1.1"

RUN pacman --noconfirm -Suy \
    && pacman --noconfirm -S vim wget zip unzip ${JAVA_VERSION} python python-pip \
    && pip install --break-system-packages python-for-android cython

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
