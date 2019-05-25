#!/bin/bash

# This build script must be run as root, otherwise it will not work correctly.
if [ $USER = "root" ]; then
	cd "$( dirname "${BASH_SOURCE[0]}" )" || exit

	echo '== Installing gWallpaper =='
	echo ''

	if [ -d /usr/lib/gwallpaper ]; then
		echo '==> Removing old library folder'
		rm -r /usr/lib/gwallpaper && echo '  -> Old library folder removed!' || echo '  -> Old library folder not removed :('
	fi

	echo '==> Making library directory'
	mkdir -p /usr/lib/gwallpaper && echo '  -> Directory created!' || echo '  -> Directory not created :('

	echo '==> Copying source folder into /usr/lib/gwallpaper'
	cp -r ./ /usr/lib/gwallpaper && echo '  -> Source folder copied!' || echo '  -> Source folder not copied :('

	if [ -e /usr/bin/gwallpaper ]; then
		echo '==> Removing old link'
		rm /usr/bin/gwallpaper && echo '  -> Old link removed!' || echo '  -> Old link not removed :('
	fi

	echo '==> Linking script into /usr/bin'
	ln -s /usr/lib/gwallpaper/gwallpaper.sh /usr/bin/wallpaper && chmod +x /usr/bin/wallpaper && echo '  -> Linking complete!' || echo '  -> Linking failed :('

	echo ''
	echo '== Install complete! =='
else
	echo 'This build script must be run as root. Please either login as root or use sudo'
fi