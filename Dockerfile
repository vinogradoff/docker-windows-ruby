FROM microsoft/windowsservercore AS core
 
ADD .\\rubyinstaller-2.4.3-1-x64 C:\\Ruby
ADD .\\msys64-2-20161025 C:\\msys64
 
RUN setx PATH %PATH%;C:\msys64;C:\Ruby\bin -m
 
# run shell that installs the rest of msys2, but returns immediatly!
# that is why waiting 120 seconds to end the installation
WORKDIR C:\\msys64
RUN powershell.exe -Command msys2_shell.cmd; Start-Sleep -s 120
 
# install mingw tools
RUN ridk install 3
 
CMD [ "cmd.exe" ]
