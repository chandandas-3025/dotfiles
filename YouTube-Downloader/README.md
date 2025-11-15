# youtube-downloader.sh

A high-quality YouTube video & playlist downloader script for **Linux**,
built around **yt-dlp** and designed for maximum quality, stability, and
simplicity.

::: section
## Supported Features

-    Best video (up to **1440p**, AV1/VP9 preferred, 60fps)
-    Best audio (OPUS, multi‑track support)
-    Thumbnail + chapters + subtitles embedding
-    MKV merging
-    Playlist indexing
-    Multi‑URL downloads
-    Archive to skip already downloaded videos

Tested mainly on **Ubuntu (Fish & Bash)**, but works on all Linux
distros.
:::

------------------------------------------------------------------------

::: section
##  Installation

###  Move the script to `/usr/local/bin`

    sudo mv youtube-downloader.sh /usr/local/bin/
    sudo chmod +x /usr/local/bin/youtube-downloader.sh

### Install the latest yt-dlp

Download the latest version from its official GitHub release page.\
*(Do NOT install from apt --- it is outdated everywhere.)*

**Verify :**

    yt-dlp --version

###  Install Deno (for YouTube JS decryption)

yt-dlp requires a JavaScript runtime for some YouTube formats.\
Install the latest Deno from the official website.

    deno --version
:::

------------------------------------------------------------------------

::: section
##  Usage

### ▶ Download a single video

    youtube-downloader.sh "https://youtu.be/VIDEO_ID"

### ▶ Download multiple videos

    youtube-downloader.sh URL1 URL2 URL3

### ▶ Download a playlist

    youtube-downloader.sh "https://youtube.com/playlist?list=PLAYLIST_ID"

### ▶ No URLs passed

Runs using your **default playlist** (set inside the script):

    youtube-downloader.sh
:::

------------------------------------------------------------------------

::: section
##  Features

-   Multi‑URL support
-   Playlist auto‑numbering (`01 - Title.mkv`)
-   Clean single video naming (`Title.mkv`)
-   Best video up to 1440p
-   60fps if available
-   OPUS audio
-   Multi‑audio stream embedding
-   Subtitles (all languages)
-   Thumbnail embedding
-   Chapters embedding
-   Automatic resume support
-   Skip‑duplicate downloads via `downloaded.txt`
:::

------------------------------------------------------------------------

::: section
##  Archive System

The file `downloaded.txt` prevents re‑downloading videos you\'ve already
saved.\
Delete it if you want to start fresh.
:::

------------------------------------------------------------------------

::: section
##  Troubleshooting

###  Deno not found

Ensure it is installed correctly and available in your PATH.

###  JS Runtime Warning from yt-dlp

Install or fix Deno --- yt-dlp uses it automatically.
:::

------------------------------------------------------------------------

::: section
##  Future Improvements (Optional)

-   A `--help` menu
-   Auto‑folder creation per playlist
-   Auto‑update checker
-   Log system
-   Optional 4K mode

Just do it yourself --- this project is already a great kick‑ass
starting point.
:::
