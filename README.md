# Homebrew ACP

Homebrew tap for [ACP (Agent Credential Proxy)](https://github.com/mikekelly/acp).

## Installation

```bash
brew tap mikekelly/acp
brew install acp-server
```

## Start as background service

```bash
brew services start acp-server
```

## Uninstall

```bash
brew services stop acp-server
brew uninstall acp-server
brew untap mikekelly/acp
```
