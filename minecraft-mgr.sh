#!/usr/bin/env bash

minecraftMGRVersion="0.1.0"

install_minecraft(){

	osID=$(grep -e "^ID=" /etc/os-release | cut -c4-)
	osCodename=$(grep -e "^UBUNTU_CODENAME=" /etc/os-release | cut -c17-)
	pkgs=""

	case $osCodename in
		bionic)
			pkgs="default-jre"
			;;
		focal)
			pkgs="default-jre"
			;;
		jammy)
			pkgs="default-jre libgdk-pixbuf2.0-0"
			;;
		lunar)
			pkgs="default-jre libgdk-pixbuf2.0-0"
			;;
		mantic)
			pkgs="default-jre libgdk-pixbuf2.0-0"
			;;
		*)
			echo "Your operating system is unsupported."
			exit 1
			;;
	esac

	wget -O /tmp/minecraft.deb https://launcher.mojang.com/download/Minecraft.deb
	sudo apt-get update && sudo apt-get install -y $pkgs
	sudo dpkg -i /tmp/minecraft.deb || (echo "Install failed, uninstalling the broken package..." && sudo apt-get purge minecraft-launcher)
}

update_minecraft(){
	if  ! dpkg -s minecraft-launcher &> /dev/null; then
		echo "Can't perform an update, Minecraft isn't installed."
		echo "Try running \`minecraft-mgr install\` instead."
		exit 1
	fi

	localVersion=$(dpkg -s minecraft-launcher | grep Version | cut -d " " -f 2)
	latestVersion=$(curl -s "https://raw.githubusercontent.com/felicianotech/minecraft-mgr/trunk/MINECRAFT_VERSION")

	if [ -z "$latestVersion" ]; then
		echo "Failed to retrieve latest version of Minecraft."
		echo "Try again later or report an issue at: https://github.com/felicianotech/minecraft-mgr/issues"
		exit 1
	fi

	if [ "$localVersion" = "$latestVersion" ]; then
		echo "You are already using the latest version of Minecraft."
	else
		echo "Minecraft v${latestVersion} is available. Installing update."
		echo "If you are currently using Minecraft, you'll need to restart after this update is complete."
		install_minecraft
	fi
}

update_minecraftMGR(){

	latestVersion=$(curl -s "https://raw.githubusercontent.com/felicianotech/minecraft-mgr/trunk/VERSION")

	if [ -z "$latestVersion" ]; then
		echo "Failed to retrieve latest version of Minecraft Manager."
		echo "Try again later or report an issue at: https://github.com/felicianotech/minecraft-mgr/issues"
		exit 1
	fi

	if [ "$minecraftMGRVersion" = "$latestVersion" ]; then
		echo "You are already using the latest version of Minecraft Manager, skipping."
	else
		echo "Minecraft Manager v${latestVersion} is available. Installing update."
		myPath=`dirname "$0"`
		myFilename=`basename "$0"`
		curl "https://raw.githubusercontent.com/felicianotech/minecraft-mgr/trunk/minecraft-mgr.sh" -o "${myPath}/${myFilename}"
	fi
}

action=$1

case $action in
	"--version")
		echo "minecraft-mgr v${minecraftMGRVersion}"
		;;
	install)
		if dpkg -s minecraft-launcher &> /dev/null; then
			echo "Minecraft is already installed."
			exit 1
		fi
		install_minecraft
		;;
	update)
		update_minecraftMGR
		update_minecraft
		;;
	*)
		echo "Unsupported action."
		;;
esac
