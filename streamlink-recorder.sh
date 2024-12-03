#!/bin/sh

# For more information visit: https://github.com/downthecrop/TwitchVOD

while [ true ]; do
	Date=$(date +%Y%m%d-%H%M%S)
	echo streamlink --plugin-dir "/home/.local/share/streamlink/plugins" --hls-live-restart $streamOptions $streamLink $streamQuality -o /home/download/$streamName"-$Date".mkv
	streamlink --plugin-dir "/home/.local/share/streamlink/plugins" --hls-live-restart $streamOptions $streamLink $streamQuality -o /home/download/$streamName"-$Date".mkv
	sleep 10s
done