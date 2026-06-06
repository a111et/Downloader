@echo off
chcp 65001 >nul
title Downloader

set "params=--force-overwrites --quiet --progress"
set "params_aria=--force-overwrites --quiet --progress --downloader aria2c"
set "outpath=%cd%"

:: Получаем буфер обмена через PowerShell (стабильно на Win11)
for /f "usebackq delims=" %%i in (`powershell -noprofile -command "Get-Clipboard"`) do set "ClipboardData=%%i"

if "%ClipboardData%"=="" (
    echo Clipboard is empty
    pause
    exit /b
)

if "%1"=="audio" goto audio
if "%1"=="audio-aria2c" goto audio_aria
if "%1"=="video" goto video
if "%1"=="video-aria2c" goto video_aria
if "%1"=="image" goto image

echo No mode specified (audio/video)
pause
exit /b

:video
title Downloading video
echo URL: %ClipboardData%

yt-dlp -o "%outpath%\%%(title)s.%%(ext)s" ^
--embed-metadata ^
-f "bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/best" ^
%params% "%ClipboardData%"

goto end

:video_aria
title Downloading video (aria2c)
echo URL: %ClipboardData%

yt-dlp -o "%outpath%\%%(title)s.%%(ext)s" ^
--embed-metadata ^
-f "bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/best" ^
%params_aria% "%ClipboardData%"

goto end

:audio
title Downloading audio
echo URL: %ClipboardData%

yt-dlp -o "%outpath%\%%(title)s.%%(ext)s" ^
--extract-audio ^
--audio-format m4a ^
--audio-quality 0 ^
--embed-metadata ^
--embed-thumbnail ^
%params% "%ClipboardData%"

goto end

:audio_aria
title Downloading audio (aria2c)
echo URL: %ClipboardData%

yt-dlp -o "%outpath%\%%(title)s.%%(ext)s" ^
--extract-audio ^
--audio-format m4a ^
--audio-quality 0 ^
--embed-metadata ^
--embed-thumbnail ^
%params_aria% "%ClipboardData%"

goto end

:image
title Downloading images
echo URL: %ClipboardData%

gallery-dl "%ClipboardData%" --dest "%outpath%"

goto end

:end
echo Done.