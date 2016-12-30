default:
	make -C libmupdf generate
	ndk-build
	ant debug

clean:
	ant clean
	ndk-build clean
	make -C libmupdf nuke

install: default
	ant debug install
