FROM androidsdk/android-30
RUN adb start-server && echo "no" | avdmanager create avd -n Android -k "system-images;android-30;google_apis;x86_64"
CMD emulator -avd Android -no-window -no-audio -no-boot-anim -accel on -gpu swiftshader_indirect