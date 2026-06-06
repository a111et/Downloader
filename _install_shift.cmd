@echo off
set "curpath=%~dp0"

copy /Y "%curpath%\yt-dlp.exe" "%windir%\aria2c.exe"
copy /Y "%curpath%\yt-dlp.exe" "%windir%\yt-dlp.exe"
copy /Y "%curpath%\gallery-dl.exe" "%windir%\gallery-dl.exe"
copy /Y "%curpath%\ffmpeg.exe" "%windir%\ffmpeg.exe"
copy /Y "%curpath%\ffprobe.exe" "%windir%\ffprobe.exe"
copy /Y "%curpath%\Downloader.ico" "%windir%\Downloader.ico"
copy /Y "%curpath%\Downloader.cmd" "%windir%\Downloader.cmd"

reg import "%curpath%\Downloader_shift.reg"