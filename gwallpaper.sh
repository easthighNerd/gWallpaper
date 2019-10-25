#!/bin/bash

WALLPAPER_CONFIG_DIR="${HOME}/.config/gwallpaper"

DATETIME=$(date '+%Y/%m/%d-%T')

if [[ ! -d ${WALLPAPER_CONFIG_DIR} ]]; then
    mkdir -p ${WALLPAPER_CONFIG_DIR}
fi

if [[ ! -e ${WALLPAPER_CONFIG_DIR}/picure-uri_list ]]; then
    touch ${WALLPAPER_CONFIG_DIR}/picture-uri_list
fi

if [[ $(cat ${WALLPAPER_CONFIG_DIR}/picture-uri_list) = "" ]]; then
    echo "${DATETIME} - $(gsettings get ${GSETTING})" > ${WALLPAPER_CONFIG_DIR}/picture-uri_list
fi

if [[ ${XDG_CURRENT_DESKTOP} = 'MATE' ]]; then
    GSETTING="org.mate.background picture-filename"
else
    GSETTING="org.gnome.desktop.background picture-uri"
fi



if [[ ${1} = "set" ]]; then
    if [[ -e ${2} ]]; then
        gsettings set ${GSETTING} "file://${2}" && echo "${DATETIME} - $(gsettings get ${GSETTING})" >> ${WALLPAPER_CONFIG_DIR}/picture-uri_list
    elif [[ ${2} = https://* ]] || [[ ${2} = http://* ]]; then
        gsettings set ${GSETTING} "${2}" && echo "${DATETIME} - $(gsettings get ${GSETTING})" >> ${WALLPAPER_CONFIG_DIR}/picture-uri_list
    else
        echo ''
        echo "ERROR: Invalid picture URI!"
    fi
elif [[ ${1} = "get" ]]; then
    gsettings get ${GSETTING}
elif [[ ${1} = "list" ]]; then
    cat ${WALLPAPER_CONFIG_DIR}/picture-uri_list | less
else
    echo 'Usage: gwallpaper [OPTION]... [PICTURE-URI]...'
    echo 'Option:'
    echo '  set                              set the wallpaper to url/path (picture-uri)'
    echo '                                     of an image'
    echo '  get                              get the uri of the current wallpaper'
    echo '  list                             see the list of wallpapers you have set'
fi
