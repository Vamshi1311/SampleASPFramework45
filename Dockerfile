# Use a Windows Server Core image as the base
FROM mcr.microsoft.com/windows/servercore:ltsc2019
# Install .NET Framework 4.5
RUN Install-WindowsFeature NET-Framework-45-ASPNET ; \
    Install-WindowsFeature Web-Asp-Net45
# Install IIS
RUN Install-WindowsFeature Web-Server

# Create a directory for your app
WORKDIR /app
# Copy the application source code to the container
COPY . .
# Build the .NET application
RUN "C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" SampleASPFramework45.sln /p:Configuration=Release

# Configure IIS
RUN Remove-WebSite -Name 'Default Web Site'
RUN New-Website -Name 'MyApp' -Port 80 -PhysicalPath 'C:\app'

# Expose the necessary ports
EXPOSE 80