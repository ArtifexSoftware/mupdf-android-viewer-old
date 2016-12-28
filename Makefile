default:
	ndk-build
	ant debug

clean:
	ndk-build clean
	ant clean

install:
	ndk-build
	ant debug install
