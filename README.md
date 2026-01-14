# Homebrew ACP

Homebrew tap for [ACP (Agent Credential Proxy)](https://github.com/mikekelly/acp) and [tsk](https://github.com/mikekelly/tsk).

## Installation

```bash
brew tap mikekelly/acp
```

### ACP Server

```bash
brew install acp-server
```

Start as background service:

```bash
brew services start acp-server
```

### tsk

```bash
brew install tsk
```

## Uninstall

### ACP Server

```bash
brew services stop acp-server
brew uninstall acp-server
```

### tsk

```bash
brew uninstall tsk
```

### Remove tap

```bash
brew untap mikekelly/acp
```
