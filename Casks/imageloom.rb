cask "imageloom" do
  version "1.0.0"
  sha256 "33d2c13ed9292c8a9c0e9d1d08c788b0f2d65e2af293cb0ff22f24df7f45c0cd"

  url "https://github.com/elapen/imageloom/releases/download/v#{version}/ImageLoom-#{version}-macOS-arm64.dmg"
  name "ImageLoom"
  desc "Local AI image studio: create, edit, upscale and export images offline"
  homepage "https://github.com/elapen/imageloom"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "ImageLoom.app"

  postflight do
    # The app is ad-hoc signed but not notarized: clear the quarantine flag so Gatekeeper does not block the first launch.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ImageLoom.app"]
  end

  # Models, history and settings live in ~/Library/Application Support/ImageLoom and are deliberately kept.
  zap trash: [
    "~/Library/Caches/io.github.elapen.imageloom",
    "~/Library/Preferences/io.github.elapen.imageloom.plist",
    "~/Library/Saved Application State/io.github.elapen.imageloom.savedState",
    "~/Library/WebKit/io.github.elapen.imageloom",
  ]
end
