default:
	ndk-build
	ant debug

clean:
	ant clean
	ndk-build clean

install: default
	ant debug install
