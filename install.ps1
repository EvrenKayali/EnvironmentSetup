#Set-ExecutionPolicy Unrestricted
 
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

cinst notepadplusplus -y
cinst cmder -y
cinst git -y
cinst googlechrome -y
cinst nodejs-lts
cinst visualstudiocode -y 
cinst visualstudio2019professional -y
cinst azure-cli -y
 
