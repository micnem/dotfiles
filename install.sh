{{- if eq .chezmoi.os "darwin" -}}
#!/bin/bash

# Python
brew install python
export PATH=/usr/local/opt/python/libexec/bin:$PATH

brew bundle --no-lock --file=/dev/stdin <<EOF
brew "git"
brew "gh"
brew "node"

{{ if eq .chezmoi.username "michaelnemni" }}
cask "warp"
cask "chrome"
cask "visual-studio-code"
cask "setapp"
cask "notion"
cask "raycast"
cask "telegram"
cask "spotify"
cask "discord"
cask "zoom"

{{ end }}

EOF

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing latest npm packages"

npm update -g
npm install -g @githubnext/github-copilot-cli 

{{ end -}}
