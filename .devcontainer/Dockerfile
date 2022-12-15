ARG VARIANT="3.0"

FROM mcr.microsoft.com/vscode/devcontainers/ruby:${VARIANT}

USER vscode
WORKDIR /home/vscode

RUN mkdir -p .config/git \
 && echo ".vscode/*" >> .config/git/ignore \
 && echo "*.code-workspace" >> .config/git/ignore \
 && echo ".history/" >> .config/git/ignore
