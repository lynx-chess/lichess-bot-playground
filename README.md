# lichess-bot-container

Dockerfile for [ghcr.io/lynx-chess/lichess-bot-playground](ghcr.io/lynx-chess/lichess-bot-playground)

## RUN

```bash
docker run --name lichess-bot-playground -it \
  --mount type=bind,src=$PWD/engines,dst=/home/src/lichess-bot/engines \
  -w /home/src/lichess-bot \
  ghcr.io/lynx-chess/lichess-bot-playground bash
```
