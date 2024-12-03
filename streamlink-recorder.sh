#!/bin/sh

# For more information visit: https://github.com/downthecrop/TwitchVOD

while [ true ]; do
	streamlink \
		--plugin-dir "/home/.local/share/streamlink/plugins" \
		--output /home/download/"{time:%Y%m%d%H%M%S}-{id}-{title}".mkv \
		--hls-live-restart \
		--retry-streams $RETRY_SECS \
		"$STREAMLINK_OPTS" $STREAM_URL $QUALITY
	sleep 10s
done