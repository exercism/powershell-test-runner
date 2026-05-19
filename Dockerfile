FROM mcr.microsoft.com/powershell:7.5-alpine-3.20@sha256:a6beeddb2fcf45547c9099fba091ce231e51aa374fe62ecc182f7c28b69a6cbf

# install packages required to run the tests
RUN apk add --no-cache jq coreutils
RUN mkdir -p /root/.config/powershell/
RUN pwsh -Command "Install-Module -Name Pester -Force"
RUN echo "Import-Module Pester" > /root/.config/powershell/Microsoft.PowerShell_profile.ps1

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
