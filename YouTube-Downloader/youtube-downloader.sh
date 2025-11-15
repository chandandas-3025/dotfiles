#!/bin/bash

# ------------------ USER CONFIG ------------------

# Default fallback playlist URL (if not passed as an argument)
defaultPlaylistUrl="https://www.youtube.com/playlist?list=YOUR_DEFAULT_LIST"

# Path to yt-dlp executable
ytDlpPath="/usr/local/bin/yt-dlp"

# Archive file to prevent redownloading
archiveFile="downloaded.txt"

# Folder to save files (empty = current folder)
outputFolder=""

# Format settings
format="bestvideo[height<=1440]+bestaudio/best[height<=1440]"
mergeFormat="mkv"

# ------------------ ARGUMENT HANDLING ------------------

if [ $# -eq 0 ]; then
    echo -e "\e[33mNo URLs passed. Using default...\e[0m"
    set -- "$defaultPlaylistUrl"
fi

# Change to output folder if set
if [ -n "$outputFolder" ]; then
    cd "$outputFolder" || { echo "Failed to change directory"; exit 1; }
fi

# ------------------ EXECUTION ------------------

for playlistUrl in "$@"; do

    # Decide output template: playlist vs single video
    if [[ "$playlistUrl" == *"list="* ]]; then
        outputTemplate="%(playlist_index)02d - %(title)s.%(ext)s"
    else
        outputTemplate="%(title)s.%(ext)s"
    fi

    # Build yt-dlp arguments
    arguments=(
        --format "$format"
        --merge-output-format "$mergeFormat"
        --output "$outputTemplate"
        --download-archive "$archiveFile"
        --ignore-errors
        --no-post-overwrites
        --embed-thumbnail
        --embed-chapters
        --audio-multistreams
        --embed-subs
        --sub-langs all
        --sub-format best
        --continue
        "$playlistUrl"
    )

    # Run yt-dlp
    echo -e "\e[32mStarting download from: $playlistUrl\e[0m"
    "$ytDlpPath" "${arguments[@]}"

done
