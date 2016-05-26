#!/bin/bash -ex

# common variables
sdk_company="2016, SuperAwesome Ltd"
sdk_theme_folder="themes"
sdk_themeres_folder="themeres"
sdk_theme="satheme"
sdk_aa_domain="AwesomeAds"
sdk_kws_domain="KWS"
sdk_devsuspport="devsupport@superawesome.tv"
sdk_iosmin="iOS 7.0+"
sdk_androidmin="API 11: Android 3.0 (Honeycomb)"
sdk_project="iOS SDK"
sdk_version_ios="3.9.7"
sdk_version_android="3.7.6"
sdk_version_unity="3.1.1"
sdk_version_air="3.1.7"
sdk_version_web="2.0.0"
sdk_version_flash="3.2.3"
sdk_version_kws="1.0.0"
sdk_version_kws_ios="1.0.2"
sdk_version_kws_android="1.0.2"
sdk_source="https://github.com/SuperAwesomeLTD/sa-kws-android-sdk"
sdk_author="Gabriel Coman"

# goto the source
cd source

# delete old theme
rm -rf $sdk_theme_folder
rm -rf $sdk_themeres_folder

# get and setup new theme
rm -rf sa-docs-sphinx-theme
git clone -b master https://github.com/SuperAwesomeLTD/sa-docs-sphinx-theme.git
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

# replace variables in rsource
cd rsource
sed -i sedbak "s|<sdk_company>|$sdk_company|g" *.*
sed -i sedbak "s|<sdk_theme_folder>|$sdk_theme_folder|g" *.*
sed -i sedbak "s|<sdk_themeres_folder>|$sdk_themeres_folder|g" *.*
sed -i sedbak "s|<sdk_theme>|$sdk_theme|g" *.*
sed -i sedbak "s|<sdk_aa_domain>|$sdk_aa_domain|g" *.*
sed -i sedbak "s|<sdk_kws_domain>|$sdk_kws_domain|g" *.*
sed -i sedbak "s|<sdk_devsuspport>|$sdk_devsuspport|g" *.*
sed -i sedbak "s|<sdk_iosmin>|$sdk_iosmin|g" *.*
sed -i sedbak "s|<sdk_androidmin>|$sdk_androidmin|g" *.*
sed -i sedbak "s|<sdk_project>|$sdk_project|g" *.*
sed -i sedbak "s|<sdk_version_ios>|$sdk_version_ios|g" *.*
sed -i sedbak "s|<sdk_version_android>|$sdk_version_android|g" *.*
sed -i sedbak "s|<sdk_version_unity>|$sdk_version_unity|g" *.*
sed -i sedbak "s|<sdk_version_air>|$sdk_version_air|g" *.*
sed -i sedbak "s|<sdk_version_flash>|$sdk_version_flash|g" *.*
sed -i sedbak "s|<sdk_version_web>|$sdk_version_web|g" *.*
sed -i sedbak "s|<sdk_version_kws>|$sdk_version_kws|g" *.*
sed -i sedbak "s|<sdk_version_kws_ios>|$sdk_version_kws_ios|g" *.*
sed -i sedbak "s|<sdk_version_kws_android>|$sdk_version_kws_android|g" *.*
sed -i sedbak "s|<sdk_source>|$sdk_source|g" *.*
sed -i sedbak "s|<sdk_author>|$sdk_author|g" *.*
find . -name "*.*sedbak" -print0 | xargs -0 rm
cd ../

# finally make the sphinx doc and cleanup
make -f Makefile html
rm -rf rsource
