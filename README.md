# Yggdrasil
A curated collection of images that can be used with Pterodactyl's Egg system. Each image is rebuilt
periodically to ensure dependencies are always up-to-date. Thanks to the developers at https://github.com/pterodactyl for this idea aswell as some images. These images are either created or modified by us to meet our needs, so pull requests will be denied by us if we believe it goes beyond the scope of the purpose of said images.

## Information
Images are hosted on `ghcr.io` and exist under the `games`, `installers` and `apps` spaces. The following logic
is used when determining which space an image will live under:

* `games` — anything within the `games` folder in the repository. These are images built for running a specific game
or type of game ex. source engine games.
* `apps` - generic images used to run programs. Some of these programs may include bots coded in compiled languages or even game servers.
* `installers` - these images are used to install different Eggs within Pterodactyl, they're not used for running any servers in Pterodactyl.

## Architecture
Most of the images are available for `linux/arm64` unless the application is only made for intel/amd architecture CPUs, like images that require steamcmd.
