# Productivity

This repo contains random productivity utilities.

## Terminal

The `helpers` directory contains various zsh helper functions. Place the following snipper in `.zshrc` to load them by default:
```
# Source all custom helper scripts in ~/.helpers
for helper in ~/.helpers/*; do
  [ -f "$helper" ] && source "$helper"
done
```
