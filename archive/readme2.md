# Install - SDK
## pull sdk
docker pull androidsdk/android-30

## run sdk Interactive  way
docker run -it --rm --device /dev/kvm androidsdk/android-30:latest bash

OR: run with Non interactive way
$ docker run -it --rm androidsdk/android-30:latest sdkmanager --list

## check installed packages
sdkmanager --list

## create and run emulator
$ avdmanager create avd -n first_avd --abi google_apis/x86_64 -k "system-images;android-30;google_apis;x86_64"
$ emulator -avd first_avd -no-window -no-audio &
$ adb devices

# Install - Appium
docker compose up, then http://localhost:4444/ui