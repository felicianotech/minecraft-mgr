# Minecraft Manager (`minecraft-mgr`) [![CircleCI Build Status](https://circleci.com/gh/felicianotech/minecraft-mgr.svg?style=shield)](https://circleci.com/gh/felicianotech/minecraft-mgr) [![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/felicianotech/minecraft-mgr/trunk/LICENSE)

`minecraft-mgr` is a script that makes installing and updating Minecraft Java
Edition on Ubuntu easier.


## Requirements

This project supports 64-bit desktop installations of Ubuntu.
Specifically, these releases:

- Ubuntu 18.04 "Bionic" 
- Ubuntu 20.04 "Focal"
- Ubuntu 22.04 "Jammy"
- Ubuntu Lunar

For 32-bit support or other distros, please open a Pull Request or Issue.


## Installation

`minecraft-mgr` is a Bash script that can be run from anywhere in your home 
directory.
Here's a typical install:

```
cd ~
curl -O https://raw.githubusercontent.com/felicianotech/minecraft-mgr/trunk/minecraft-mgr.sh
chmod +x ~/minecraft-mgr.sh
```


## Usage

```
~/minecraft-mgr.sh install
```

Installs the Minecraft Java Edition on your machine.

```
~/minecraft-mgr.sh update
```

If a newer version of Minecraft or Minecraft Manager is available, download and install it.


## Updating Minecraft Manager

Minecraft Manager will update itself when running `./minecraft-mgr.sh update`.


## Development

Instructions coming in the future.


## License

The source code for `minecraft-mgr` is licensed under the MIT license.
This repo's license can be found [here](./LICENSE).
Minecraft itself is a proprietary product by [Mojang/Microsoft](https://www.minecraft.net/en-us).
This project is not affiliated with nor endorsed by them.
