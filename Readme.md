# Working version - appium and android emulator in docker containers
1. Create budtmo android emulator container:
```
docker run -d -p 6080:6080 -p 4722:4723 -p 5555:5555 -p 5554:5554 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true -e APPIUM=true --device /dev/kvm --name android-container --network appium-network budtmo/docker-android:emulator_11.0
```

2. Create Appium container (or use APPIUM=true in budtmo container):
```
docker run --privileged -d -p 4723:4723  -v /dev/bus/usb:/dev/bus/usb --name appium-container --network appium-network appium/appium
```

3. Add connection to emulator from appium container (if created):
```
adb connect android-container:5555
```

# Summary
1. Budtmo + Appium from docker run: Time of execution: 15-30s (simple battery test). Standalone appium was not nessesary (budtmo has its own appium server).
2. I was able to create Appium server as docker compose.
3. I failed to create budtmo emulator as docker compose (I had some error with translate property --device /dev/kvm to docker compose).
4. I was able to create standalone emulator from androidsdk/android-30 with working emulator, but I failed to connect it to appium server - port 5555 with emulator was not visible from appium container.
5. I dont know, how make emulator visible for other containers. I tried to use --network appium-network, but it was not working.