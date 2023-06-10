# WORKING: NO

# Pobieranie obrazu bazowego
FROM ubuntu:latest

# Instalowanie Java JDK
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk

RUN apt-get update && \
    apt-get -y install curl && \
    apt-get -y install unzip

# Definiowanie zmiennych
ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    ANDROID_HOME="/usr/local/android-sdk" \
    ANDROID_VERSION=26 \
    ANDROID_BUILD_TOOLS_VERSION=26.0.2

# Download Android SDK
RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses

# Install Android Build Tool and Libraries
RUN $ANDROID_HOME/tools/bin/sdkmanager --update
RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools"

# Instalowanie obrazu systemu Android
RUN sdkmanager "system-images;android-34;google_apis;x86"

# Uruchamianie serwera adb
RUN adb start-server

# Tworzenie wirtualnego urządzenia Android
RUN echo "no" | avdmanager create avd -n Android -k "system-images;android-34;google_apis;x86_64"

# Konfiguracja uruchamiania emulatora
CMD emulator -avd Android -no-window -no-audio -no-boot-anim -accel on -gpu swiftshader_indirect

# Instalowanie Appium
RUN apt-get install -y npm && \
    npm install -g appium

# Kopiowanie pliku APK do kontenera
COPY app.apk /app.apk
