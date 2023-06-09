docker network create appium-network

v1 

docker run -d -p 6080:6080 -p 4723:4723 -p 5555:5555 -p 5554:5554 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true -e APPIUM=true --device /dev/kvm --name android-container --network appium-network budtmo/docker-android:emulator_11.0

docker run --privileged -d -p 4722:4723  -v /dev/bus/usb:/dev/bus/usb --name appium-container --network appium-network appium/appium

adb connect android-container:5555

v2

docker run -d -p 5555:5555 -p 5554:5554 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=false -e APPIUM=false --device /dev/kvm --name android-container --network appium-network budtmo/docker-android:emulator_11.0

docker run --privileged -d -p 4723:4723 --name appium-container --network appium-network appium/appium

adb connect android-container:5555


v3
docker run -d -p 5555:5555 -p 5554:5554 -p 5037:5037 --device /dev/kvm --privileged --name android-emulator --network appium-network docker_emu


v4
docker run -d -p 4723:4723 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=false -e APPIUM=true --device /dev/kvm --name android-emulator budtmo/docker-android:emulator_11.0


v5