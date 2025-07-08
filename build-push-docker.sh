#!/bin/bash

if [ -z "$1" ]; then
  echo "You must specify the version increment as 'major', 'minor', or 'patch'."
  exit 1
fi

PACKAGE_NAME=$(grep -oP '"name": "\K(.*?)(?=")' package.json)
CURRENT_VERSION=$(grep -oP '"version": "\K(.*?)(?=")' package.json)
NEW_VERSION=$(npm version $1 --no-git-tag-version)
NEW_VERSION="${NEW_VERSION//v/}"

echo "Package name: $PACKAGE_NAME"
echo "Current version: $CURRENT_VERSION"
echo "New version: $NEW_VERSION"

docker build -t harbor.kindle-techprojects.com/ktp-homelab/$PACKAGE_NAME:$NEW_VERSION .

docker tag harbor.kindle-techprojects.com/ktp-homelab/$PACKAGE_NAME:$NEW_VERSION \
  harbor.kindle-techprojects.com/ktp-homelab/$PACKAGE_NAME:latest

docker push harbor.kindle-techprojects.com/ktp-homelab/$PACKAGE_NAME:$NEW_VERSION
docker push harbor.kindle-techprojects.com/ktp-homelab/$PACKAGE_NAME:latest
