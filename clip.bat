REM This script is for Windows, but the same principle of the script applies to linux 
REM This will download parts of media from youtube, from the start timecode to the end timecode
REM Requires youtube-dl and ffmpeg in your path

SET /P url=
SET /P starttime = 
SET /P stoptime = 
set /A Counter=1

REM Show available formats
youtube-dl.exe --no-check-certificate -F %url% 
set /P format=

FOR /F %%A IN ('youtube-dl.exe -f %format% --no-check-certificate -g %url%') DO (
	set /A Counter+=1
	ffmpeg.exe -strict -2 -ss 00:00:00 -i "%%A" -c copy -t 00:01:00 %Counter%.mp4
)