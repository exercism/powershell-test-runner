FROM mcr.microsoft.com/powershell:7.3-alpine-3.14

# install packages required to run the tests
RUN apk add --no-cache jq coreutils
RUN pwsh -Command "Install-Module -Name Pester -Force"

WORKDIR /opt/test-runner
COPY . .
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
