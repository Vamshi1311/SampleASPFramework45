# Use a Windows Server Core image as the base
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8

# Create a directory for your app
WORKDIR /app

# Copy the application source code to the container
COPY . .

# Build the .NET application
RUN "C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" SampleASPFramework45.sln /p:Configuration=Release

# Expose the necessary ports
EXPOSE 80
