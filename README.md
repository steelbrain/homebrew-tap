# steelbrain/tap

Homebrew casks for apps published under
[github.com/steelbrain](https://github.com/steelbrain).

## Casks

| Cask | App | Requires |
| --- | --- | --- |
| `rdpeek` | [RDPeek](https://rdpeek.com/), a native macOS remote desktop client ([source](https://github.com/steelbrain/RDPeek)) | macOS 14 or later |

## Install

```sh
brew install --cask steelbrain/tap/rdpeek
```

If you already installed RDPeek from its GitHub release, Homebrew stops
because `/Applications/RDPeek.app` exists. Add `--adopt` to let Homebrew
manage that copy (it must be the same version as the cask), or `--force`
to replace it. Either way your saved PCs and settings stay.

```sh
brew install --cask --adopt steelbrain/tap/rdpeek
```

## Update and uninstall

```sh
brew upgrade --cask steelbrain/tap/rdpeek
brew uninstall --cask steelbrain/tap/rdpeek
```

`brew uninstall --zap --cask steelbrain/tap/rdpeek` also deletes RDPeek's
settings, including its list of saved PCs. Passwords that RDPeek saved
stay in your login Keychain; remove them with Keychain Access.
