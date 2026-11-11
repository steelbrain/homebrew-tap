# Agent Instructions

These conventions are mandatory for this repository.

## Project Context

This is the Homebrew tap `steelbrain/tap` (the GitHub repository
`steelbrain/homebrew-tap`). Users install from it with
`brew install --cask steelbrain/tap/<cask>`.

User-facing instructions (this README, app READMEs, websites) always use
the full name `steelbrain/tap/<cask>`, in every `brew` command. Never tell
users to run `brew tap steelbrain/tap` or `brew trust`. Installing by full
name taps the repository and trusts the cask, which Homebrew 6.0 and later
require for casks outside Homebrew's own taps.

- `Casks/<cask>.rb` — one cask per app.
- `Casks/lemurcam.rb` — [LemurCam](https://github.com/steelbrain/LemurCam).
  Each LemurCam release `v<version>` on GitHub (two-part versions, such as
  `v1.6`) carries a signed, notarized `LemurCam.zip` with `LemurCam.app`
  at its top level.
- `Casks/rdpeek.rb` — [RDPeek](https://github.com/steelbrain/RDPeek). Each
  RDPeek release `v<version>` on GitHub carries a signed, notarized
  `RDPeek.zip` with `RDPeek.app` at its top level.

Homebrew reads casks from the tap's default branch, `master`. Whatever is on
`master` reaches every user on their next `brew update`, so validate before
it lands there.

## Updating a Cask for a New Release

1. Download the release asset and hash it, for example:
   `curl -sLO https://github.com/steelbrain/RDPeek/releases/download/v<version>/RDPeek.zip`
   then `shasum -a 256 RDPeek.zip`. Do this in a fresh, empty directory.
   For LemurCam the asset is
   `https://github.com/steelbrain/LemurCam/releases/download/v<version>/LemurCam.zip`.
2. Set `version` and `sha256` in the cask. The `url` interpolates
   `version`; don't hardcode it.
3. Keep `depends_on macos:` equal to the app's minimum macOS. For RDPeek
   and LemurCam that is `deploymentTarget` in their `project.yml` (14.0,
   `:sonoma`).
   Write the bare symbol (`depends_on macos: :sonoma`); `brew style`
   rejects the `">= :sonoma"` form.
4. Validate (below), then commit.

## Cask Rules

- Follow Homebrew's Cask Cookbook; `brew style` and `brew audit` decide.
- `desc` must not start with an article or the app's name, and must not
  mention the platform (no "macOS", "Mac").
- `zap` lists only paths the app writes. RDPeek's bundle identifier is
  `ai.aneesiqbal.rdpeek`, and it is not sandboxed, so its data is under
  `~/Library`, not `~/Library/Containers`. LemurCam's bundle identifier
  is `cam.lemur.app`; it is not sandboxed either, and it also writes to
  its app group `2KG9772KH6.cam.lemur.app` (`~/Library/Group Containers`
  and `~/Library/Application Scripts`). `zap` cannot remove Keychain
  items; don't try.
- LemurCam installs a camera system extension, and its Settings can
  install a privileged helper and a microphone driver in
  `/Library/Audio/Plug-Ins/HAL`. The app installs, updates and removes
  these itself. Don't add `uninstall` directives for them: Homebrew runs
  `uninstall` on every `brew upgrade` too, which would remove the
  microphone each time the app updates.
- Don't add `auto_updates true` unless the app ships its own updater.
  RDPeek and LemurCam have none, so `brew upgrade` is how users get new
  versions.
- Only ship signed, notarized builds. Never add quarantine removal or
  `--no-quarantine` advice.

## Validation

Homebrew audits a cask only from a tapped tap, and it refuses to load
casks from taps that aren't trusted. Validate committed work under a
throwaway tap name, so a real `steelbrain/tap` on the machine is left
alone. `brew tap` clones the committed `HEAD` of the local repository, so
commit first (on a branch, not `master`):

```sh
export HOMEBREW_NO_AUTO_UPDATE=1
brew tap steelbraindraft/tap "$PWD"
brew trust --tap steelbraindraft/tap
brew style --cask steelbraindraft/tap/<cask>
brew audit --cask --online --strict steelbraindraft/tap/<cask>
brew livecheck --cask steelbraindraft/tap/<cask>
brew untrust --tap steelbraindraft/tap
brew untap steelbraindraft/tap
```

- `brew style` must report no offenses, and `brew audit` must report no
  problems. `--online` downloads and extracts the release asset, which
  checks the URL, the `sha256` and the archive contents.
- `brew livecheck` must print the new version on both sides of `==>`.
- Don't pass `--new` to `brew audit`. It applies the notability rules of
  Homebrew's official cask repository, which don't apply to this tap.
- Don't install a cask on a machine that already has the app installed
  outside Homebrew: `brew install` stops when the app is already in
  `/Applications`, and `--force` would replace the owner's copy.
- Before any `brew install`, `upgrade` or `uninstall` (even a `--dry-run`
  or one that fails), `export HOMEBREW_NO_AUTOREMOVE=1
  HOMEBREW_NO_INSTALL_CLEANUP=1`. Otherwise `brew uninstall` removes the
  owner's unneeded formulae, even when the cask isn't installed.
- Delete the downloaded zip and Homebrew's cached copy
  (`~/Library/Caches/Homebrew/downloads/*--RDPeek.zip`,
  `*--LemurCam.zip`) when done.

## Git Conventions

### Branch Naming

- All new branches MUST be prefixed with `steelbrain/`.
- Format: `steelbrain/<descriptive-kebab-case-name>`.

### Commit Messages

- MUST use present tense, imperative mood.
- First line MUST be 72 characters or fewer.
- NEVER write vague messages like "Fix bug" or "Update code".
- When opening a pull request, omit the emoji prefix from the PR title.

### Emoji Prefixes

Use these exact text prefixes when applicable:

| Prefix | When to use |
| --- | --- |
| `:new:` | Adding a cask |
| `:arrow_up:` | Updating a cask to a newer app version |
| `:arrow_down:` | Moving a cask back to an older app version |
| `:bug:` | Fixing a cask |
| `:fire:` | Removing a cask or files |
| `:memo:` | Writing docs |
| `:art:` | Improving format or structure |
| `:lock:` | Security |

If none of these fit, omit the prefix. NEVER force-fit one.
