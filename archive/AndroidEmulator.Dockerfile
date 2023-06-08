FROM androidsdk/android-30
RUN adb start-server && echo "no" | avdmanager create avd -n Android -k "system-images;android-30;google_apis;x86_64"
CMD emulator -avd Android -no-window -no-audio -no-boot-anim -accel on -gpu swiftshader_indirect

--abi google_apis/x86_64 -k "system-images;android-30;google_apis;x86_64"
                            "system-images;android-34;google_apis;x86_64"
    Description:        Google APIs Intel x86_64 Atom System Image
    Version:            6
    Dependencies:
        patcher;v4
        emulator Revision 32.1.8
--abi google_apis_playstore/x86_64 -k "system-images;android-34;google_apis_playstore;x86_64"

avdmanager create avd -n Android -k "system-images;android-34;google_apis_playstore;x86_64"
