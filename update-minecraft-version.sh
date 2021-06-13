#!/usr/bin/env bash

wget -O /tmp/minecraft.deb https://launcher.mojang.com/download/Minecraft.deb
latestVersion=$(dpkg-deb -f /tmp/minecraft.deb Version)
localVersion=$(cat ./MINECRAFT_VERSION)

if [ -z "$latestVersion" ]; then
	echo "Failed to retrieve latest version of Minecraft."
	echo "Try again later or report an issue at: https://github.com/felicianotech/minecraft-mgr/issues"
	exit 1
fi

if [ "$localVersion" = "$latestVersion" ]; then
	echo "The local Minecraft version is current."
	exit
fi

echo $latestVersion > ./MINECRAFT_VERSION
