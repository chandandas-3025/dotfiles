# youtube-downloader.sh

## Overview

`youtube-downloader.sh` is a high-quality YouTube video and playlist
downloader script for Linux. It is built around `yt-dlp` and designed
for maximum quality, stability, and simplicity.

Tested mainly on Ubuntu (Fish & Bash), but works on all Linux
distributions.

## Supported Features

- Best video up to **1440p** (AV1/VP9 preferred, 60fps when available)
- Best audio (OPUS, multi-track support)
- Embedded thumbnails
- Embedded chapters
- Subtitles (all languages)
- MKV merging
- Playlist indexing
- Multi-URL downloads
- Archive to skip already-downloaded videos
- Automatic resume support
- Clean naming (e.g., `Title.mkv`, `01 - Title.mkv`)

## Installation

### 1. Move the Script to `/usr/local/bin`

``` bash
sudo mv youtube-downloader.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/youtube-downloader.sh
```

### 2. Install the Latest yt-dlp

Download from its official GitHub releases page. (Avoid installing from
apt - it is outdated.)

Verify installation:

``` bash
yt-dlp --version
```

### 3. Install Deno (JavaScript Runtime for Signature Decryption)

``` bash
deno --version
```

## Usage

### Download a Single Video

``` bash
youtube-downloader.sh "https://youtu.be/VIDEO_ID"
```

### Download Multiple Videos

``` bash
youtube-downloader.sh URL1 URL2 URL3
```

### Download a Playlist

``` bash
youtube-downloader.sh "https://youtube.com/playlist?list=PLAYLIST_ID"
```

### Run Without URLs

Uses the default playlist configured inside the script:

``` bash
youtube-downloader.sh
```

## Archive System

The file `downloaded.txt` prevents re-downloading already saved videos.
Delete it if you want to reset the archive.

## Troubleshooting

### Deno Not Found

Ensure Deno is installed correctly and available in your `PATH`.

### JS Runtime Warning from yt-dlp

Install or fix Deno - yt-dlp will automatically detect it.

## Planned Improvements

- `--help` menu

- Automatic folder creation per playlist

- Auto-update checker

- Logging system

- Optional 4K mode
