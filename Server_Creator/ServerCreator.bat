@echo off
echo "User name is:"
echo %USERNAME%
cd C:\Users\%USERNAME%\Desktop
echo "creating server directory..."
md MC_Server
cd C:\Users\%USERNAME%\Desktop\MC_Server
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar', 'server.jar')"
powershell -Command "Invoke-WebRequest https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar"
echo "Server JAVA file downloaded..."
echo "Creating Runtime Batchfile..."\
(
echo java -Xmx1024M -Xms1024M -jar server.jar nogui
echo pause
)>Start.bat
echo "Start.bat Created!"
echo "Starting your server..."
START Start.bat
echo "server started..."
(
echo eula = true
)> eula.txt
echo "eula accepted..."
echo "SUCCESS! You now have a minecraft server!"
echo "Type stop in your server cmd prompt to stop the server"
echo "echo you may now close this window"
pause