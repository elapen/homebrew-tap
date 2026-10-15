# elapen/homebrew-tap

Homebrew tap for two open-source Mac apps:

- [ImageLoom](https://github.com/elapen/imageloom), a local AI image studio: `brew install --cask elapen/tap/imageloom`
- [Tilqos](https://github.com/elapen/tilqos), a keyboard-layout fixer for English, Russian and Kazakh: `brew install --cask elapen/tap/tilqos`

Apple Silicon, macOS 13+. The app is ad-hoc signed but not notarized; the cask clears the quarantine flag so it opens without the Gatekeeper prompt.
Your models, history and settings stay in `~/Library/Application Support/ImageLoom` when you uninstall (`brew uninstall --zap` removes only caches and preferences).
