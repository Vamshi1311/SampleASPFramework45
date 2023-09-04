# start with a base image with all the necessary tooling to compile our app
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
# set the working directory inside compilation container to c:\app
WORKDIR /app
RUN powershell -Command "Install-Package -Id 'ADOdb' -Version '7.0.3300.0' -Source 'https://api.nuget.org/v3/index.json' -Destination './packages'"

