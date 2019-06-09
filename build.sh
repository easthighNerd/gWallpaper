#!/bin/bash

# This build script must be run as root, otherwise it will not work correctly.
if [ $USER = "root" ]; then
	cd "$( dirname "${BASH_SOURCE[0]}" )" || exit

	echo '== Installing gWallpaper =='
	echo ''

	if [ -d /usr/lib/gwallpaper ]; then
		echo '==> Removing old library folder...'
		rm -r /usr/lib/gwallpaper && echo '  -> Old library folder removed!' || echo '  -> Old library folder not removed :('
	fi

	if [[ ! -d /use/lib/gwallpaper ]]; then
		echo '==> Creating library directory...'
		mkdir -p /usr/lib/gwallpaper && echo '  -> Directory created!' || echo '  -> Directory not created :('
	else
		echo "ERROR: library directory already exists!" && exit
	fi

	if [[ -d /usr/lib/gwallpaper ]]; then
		echo '==> Copying source folder into /usr/lib/gwallpaper...'
		cp -r ./ /usr/lib/gwallpaper && echo '  -> Source folder copied!' || echo '  -> Source folder not copied :('
	else
		echo "ERROR: unable to copy source folder into /usr/lib/gwallpaper, directory does not exist!" && exit
	fi

	if [ -e /usr/bin/wallpaper ]; then
		echo '==> Removing old link...'
		rm /usr/bin/wallpaper && echo '  -> Old link removed!' || echo '  -> Old link not removed :('
	fi

	if [[ ! -e /usr/bin/wallpaper ]]; then
		echo '==> Linking script into /usr/bin...'
		ln -s /usr/lib/gwallpaper/gwallpaper.sh /usr/bin/wallpaper && chmod +x /usr/bin/wallpaper && echo '  -> Linking complete!' || echo '  -> Linking failed :('
	else
		echo "ERROR: unable to link script into /usr/bin, file already exists!" && exit
	fi

	echo ''
	echo '== Install complete! =='
else
	echo 'This build script must be run as root. Please either login as root or use sudo'
fi