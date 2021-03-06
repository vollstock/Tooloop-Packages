#!/bin/bash

for folder in *; do
    if [ -d $folder ]; then
        rm -f $folder/*.deb
        rm -f *.zip
    fi
done

rm -fr /assets/packages/*.deb
rm -fr /assets/packages/Packages*
rm -fr /assets/packages/Release
rm -fr /assets/packages/media/*

exit 0
