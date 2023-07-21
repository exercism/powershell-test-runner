FROM mcr.microsoft.com/powershell:7.3-alpine-3.17

# install packages required to run the tests
RUN apk add --no-cache jq coreutils
RUN mkdir -p /root/.config/powershell/
RUN pwsh -Command "Install-Module -Name Pester -Force"
RUN echo "Import-Module Pester" > /root/.config/powershell/Microsoft.PowerShell_profile.ps1

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
