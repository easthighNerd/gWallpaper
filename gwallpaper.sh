#!/bin/bash

WALLPAPER_CONFIG_DIR="${HOME}/.config/wallpaper-easthighNerd"

DATETIME=$(date '+%Y/%m/%d-%T')

if [[ ! -d ${WALLPAPER_CONFIG_DIR} ]]; then
    mkdir -p ${WALLPAPER_CONFIG_DIR}
fi

if [[ ! -e ${WALLPAPER_CONFIG_DIR}/picure-uri_list ]]; then
    touch ${WALLPAPER_CONFIG_DIR}/picture-uri_list
fi

if [[ $(cat ${WALLPAPER_CONFIG_DIR}/picture-uri_list) = "" ]]; then
    echo "${DATETIME} - $(gsettings get org.gnome.desktop.background picture-uri)" > ${WALLPAPER_CONFIG_DIR}/picture-uri_list
fi

if [[ ${1} = "set" ]]; then
    if [[ -e ${2} ]]; then
        gsettings set org.gnome.desktop.background picture-uri "file://${2}" && echo "${DATETIME} - $(gsettings get org.gnome.desktop.background picture-uri)" >> ${WALLPAPER_CONFIG_DIR}/picture-uri_list
    elif [[ ${2} = https://* ]] || [[ ${2} = http://* ]]; then
        gsettings set org.gnome.desktop.background picture-uri "${2}" && echo "${DATETIME} - $(gsettings get org.gnome.desktop.background picture-uri)" >> ${WALLPAPER_CONFIG_DIR}/picture-uri_list
    else
        echo ''
        echo "Wallpaper not valid"
    fi
elif [[ ${1} = "get" ]]; then
    gsettings get org.gnome.desktop.background picture-uri
else
    echo 'Usage: wallpaper [OPTION]... [PICTURE-URI]...'
    echo 'Option:'
    echo '  set                              set the wallpaper to url/path (picture-uri)'
    echo '                                     of an image'
    echo '  get                              get the uri of the current wallpaper'
fi

