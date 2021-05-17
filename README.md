# Yggdrasil
A curated collection of images that can be used with Pterodactyl's Egg system. Each image is rebuilt
periodically to ensure dependencies are always up-to-date. Thanks to the developers at https://github.com/pterodactyl for this idea aswell as some images stored here.

Images are hosted on `ghcr.io` and exist under the `games`, and `apps` spaces. The following logic
is used when determining which space an image will live under:

* `games` — anything within the `games` folder in the repository. These are images built for running a specific game
or type of game.
* `apps` - generic images used to run programs. Some of these programs may include bots coded in compiled languages or even game servers.

All of these images are available for `linux/amd64` version(s). Currently looking into creating them for `linux/arm64`...
