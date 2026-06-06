@echo off

del /s /f /q "%windir%\aria2c.exe"
del /s /f /q "%windir%\ffmpeg.exe"
del /s /f /q "%windir%\ffprobe.exe"
del /s /f /q "%windir%\gallery-dl.exe"
del /s /f /q "%windir%\yt-dlp.exe"
del /s /f /q "%windir%\Downloader.ico"
del /s /f /q "%windir%\Downloader.cmd"

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\background\shell\Downloader" /f