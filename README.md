# gWallpaper
Script to set the wallpaper using `gsettings`. This allows for using either a local image or a remote URL

---

To build, cd into the directory and run
```
# ./build.sh
```

---

To set a wallpaper, run
```
$ gwallpaper set <picture-uri>
```
where `<picture-uri>` is the local file or remote url you want to set as your wallpaper.

---

You can use
```
$ gwallpaper get
```
to see the location/url of the current wallpaper.

---

A history of wallpapers you have set using gWallpaper is saved in `$HOME/.config/gwallpaper/picture-uri_list`

---

Snap package does not work properly, so please build normally unless you want to fiddle with the yaml