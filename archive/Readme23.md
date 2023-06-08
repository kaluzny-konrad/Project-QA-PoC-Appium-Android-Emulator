docker run -it --rm --device /dev/kvm androidsdk/android-30:latest bash

sdkmanager --list
sdkmanager --licenses

sdkmanager --install "system-images;android-34;google_apis;x86"

RUN adb start-server && echo "no" | avdmanager create avd -n Android -k "system-images;android-34;google_apis;x86_64"
CMD emulator -avd Android -no-window -no-audio -no-boot-anim -accel on -gpu swiftshader_indirect

