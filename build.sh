#!/bin/bash

set -e

# build packages
for folder in *; do
    if [ -d $folder ] && [ ${folder:0:1}  != "#" ]; then
        # Get package infos
        package="$(cat $folder/package/DEBIAN/control | grep 'Package: ')"
        arch="$(cat $folder/package/DEBIAN/control | grep 'Architecture: ')"
        version="$(cat $folder/package/DEBIAN/control | grep 'Version: ')"
        packagename="${package#*: }_${version#*: }_${arch#*: }"
        # Build Debian package
        dpkg  --build $folder/package $folder/$packagename.deb
        # Bundle it with media files for Tooloop app center
        zip -9 --exclude=*package* $packagename.zip $folder/$packagename.deb $folder/media/*.png $folder/media/*.jpg
    fi
done