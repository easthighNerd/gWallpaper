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
$ wallpaper set <picture-uri>
```
where `<picture-uri>` is the local file or remote url you want to set as your wallpaper.

---

You can use
```
<<<<<<< HEAD
$ wallpaper get
=======
wallpaper get
>>>>>>> 1f66b8e39573a402220e22d0e0483b6e6e4e1b5d
```
to see the location/url of the current wallpaper.

---

A history of wallpapers you have set using gWallpaper is saved in `$HOME/.config/gwallpaper/picture-uri_list`