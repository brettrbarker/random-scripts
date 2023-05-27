import mpv
import time

# Define the URL of the stream
stream_url = ""
print("Stream URL: " + stream_url)

# Create an MPV player instance
player = mpv.MPV()

# Uncomment the following line to enable fullscreen
# player.fullscreen = True

# Load the stream URL
player.play(stream_url)

# Set the initial playback time
lastPlaybackTime = 0

# Allow stream 10 seconds to start before checking
time.sleep(10)

# Loop indefinitely
while True:
    print("Playback time: " + str(player.playback_time))
    # Wait for a short time
    time.sleep(0.5)

    if lastPlaybackTime == player.playback_time:
        print("Stream is frozen")
        # restart stream
        player.play(stream_url)
        time.sleep(10)

    lastPlaybackTime = player.playback_time