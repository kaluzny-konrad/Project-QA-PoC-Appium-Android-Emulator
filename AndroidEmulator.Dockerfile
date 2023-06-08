FROM androidsdk/android-30
RUN echo "no" | avdmanager create avd -n first_avd --abi google_apis/x86_64 -k "system-images;android-30;google_apis;x86_64"
CMD emulator -avd first_avd -no-window -no-audio
