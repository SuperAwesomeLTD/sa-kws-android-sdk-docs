#!/bin/bash -ex

sdk_theme_folder="themes"
sdk_themeres_folder="themeres"
sdk_theme="satheme"

cd source

sed -i sedbak "s|<sdk_theme_folder>|$sdk_theme_folder|g" *.*
sed -i sedbak "s|<sdk_themeres_folder>|$sdk_themeres_folder|g" *.*
sed -i sedbak "s|<sdk_theme>|$sdk_theme|g" *.*
find . -name "*.*sedbak" -print0 | xargs -0 rm

# delete old theme
rm -rf $sdk_theme_folder
rm -rf $sdk_themeres_folder

# get and setup new theme
rm -rf sa-docs-sphinx-theme
git clone -b master git@github.com:SuperAwesomeLTD/sa-docs-sphinx-theme.git
mkdir $sdk_theme_folder
mkdir $sdk_theme_folder/$sdk_theme
mkdir $sdk_themeres_folder
cp -rf sa-docs-sphinx-theme/* $sdk_theme_folder/$sdk_theme/
cp sa-docs-sphinx-theme/static/img/* $sdk_themeres_folder/
rm -rf sa-docs-sphinx-theme

cd ../

# create temporary rsource folder
rm -rf rsource
mkdir rsource
cp -rf source/* rsource

# finally make the sphinx doc and cleanup
make -f Makefile html
rm -rf rsource
