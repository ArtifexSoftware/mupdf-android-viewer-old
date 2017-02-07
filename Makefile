default: debug
install: install-debug

APP_ABI=x86

build.xml:
	android update project -p . -t android-16 -n "MuPDF"

generate:
	make -C libmupdf generate

jni-debug: build.xml generate
	ndk-build -j8 APP_OPTIM=debug APP_ABI=$(APP_ABI)
jni-release: build.xml generate
	ndk-build -j8 APP_OPTIM=release APP_ABI=$(APP_ABI)

debug: jni-debug
	ant debug
install-debug: jni-debug
	ant debug install

release: jni-release
	ant release
install-release: jni-release
	ant release install

run: install-debug
	adb shell am start -n com.artifex.mupdfdemo/.ChoosePDFActivity

clean:
	rm -f build.xml
	rm -rf bin gen libs obj
