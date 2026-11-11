# steelbrain/tap

Homebrew casks for apps published under
[github.com/steelbrain](https://github.com/steelbrain).

## Casks

| Cask | App | Requires |
| --- | --- | --- |
| `dhol` | [Dhol](https://github.com/steelbrain/dhol.app), a menu bar dictation app that transcribes speech on your Mac | Apple silicon, macOS 14 or later |
| `lemurcam` | [LemurCam](https://lemur.cam/), a virtual webcam for RTSP and ONVIF IP cameras ([source](https://github.com/steelbrain/LemurCam)) | macOS 14 or later |
| `rdpeek` | [RDPeek](https://rdpeek.com/), a native macOS remote desktop client ([source](https://github.com/steelbrain/RDPeek)) | macOS 14 or later |

## Install

```sh
brew install --cask steelbrain/tap/dhol
brew install --cask steelbrain/tap/lemurcam
brew install --cask steelbrain/tap/rdpeek
```

If you already installed an app from its GitHub release, Homebrew stops
because the app already exists in `/Applications`. Add `--adopt` to let
Homebrew manage that copy (it must be the same version as the cask), or
`--force` to replace it. Either way your settings stay.

```sh
brew install --cask --adopt steelbrain/tap/<cask>
```

## Update and uninstall

```sh
brew upgrade --cask steelbrain/tap/<cask>
brew uninstall --cask steelbrain/tap/<cask>
```

### Dhol

`brew uninstall --zap --cask steelbrain/tap/dhol` also deletes Dhol's
settings, including its dictation shortcut, and the 2.5 GB speech model
it downloaded to `~/.cache/huggingface/hub` on first launch. Another app
that uses the same model (`mlx-community/parakeet-tdt-0.6b-v3`) will
download it again.

### LemurCam

If you turned on the LemurCam microphone, remove it before uninstalling:
open LemurCam's Settings, go to Setup & Status and click Remove
Microphone. `brew uninstall` removes only `LemurCam.app`.

`brew uninstall --zap --cask steelbrain/tap/lemurcam` also deletes
LemurCam's settings, including its list of saved cameras. Camera
passwords that LemurCam saved stay in your login Keychain; remove them
with Keychain Access.

### RDPeek

`brew uninstall --zap --cask steelbrain/tap/rdpeek` also deletes RDPeek's
settings, including its list of saved PCs. Passwords that RDPeek saved
stay in your login Keychain; remove them with Keychain Access.
