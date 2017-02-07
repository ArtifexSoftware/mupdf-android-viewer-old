android update project -p . -t android-16 -n "MuPDF"
rem make -C libmupdf generate
ndk-build -j8 APP_OPTIM=debug APP_ABI=armeabi-v7a,x86
ant debug
