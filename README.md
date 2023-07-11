# lichess-bot-playground

Docker image around [lichess-bot](https://github.com/lichess-bot-devs/lichess-bot) that has all its dependencies pre-installed and therefore it's 'ready to use'.

## Starting the playground

These commands run [ghcr.io/lynx-chess/lichess-bot-playground](https://github.com/lynx-chess/lichess-bot-playground/pkgs/container/lichess-bot-playground) and mount a shared volume between your machine and the container.

You can then place your chess engine in `/engines` dir, configure `config.yml` to make `lichess-bot` point to it and retrieve any logs later without worrying about the lifetime of the container.

### Bash

```bash
docker run -it \
  --mount type=bind,src=$PWD/engines,dst=/home/src/lichess-bot/engines \
  -w /home/src/lichess-bot \
  ghcr.io/lynx-chess/lichess-bot-playground:latest bash
```

### PowerShell (pwsh)

```powershell
docker run -it `
  --mount type=bind,src=$PWD/engines,dst=/home/src/lichess-bot/engines `
  -w /home/src/lichess-bot `
  ghcr.io/lynx-chess/lichess-bot-playground:latest bash
```

## Configuring the playground to run your chess engine

Once inside the container, you should be able to run `python3 lichess-bot.py` command, even if it fails.

However, to make `lichess-bot` work properly, `config.yml` file needs to be tweaked as desired, but at least:

- Modifying engine__dir and engine__name so that they point to your engine's Linux binary.

- Providing a lichess bot token. This can also be done via the environment variable `LICHESS_BOT_TOKEN` (i.e. appending `LICHESS_BOT_TOKEN=xxxxxxxx` to the docker command) instead of manually in the file.

See [lichess-bot](https://github.com/lichess-bot-devs/lichess-bot) for more information about its configuration.
