docker build -t android_emu .

docker run \
   -it --rm \
   -v "$PWD":/application \
   android_emu \
   sh -c "$@"