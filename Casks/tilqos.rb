cask "tilqos" do
  version "1.0.0"
  sha256 "4d79e505429ebfdb227da491830c29a57e66092dea500862fdf36c6418b91673"

  url "https://github.com/elapen/tilqos/releases/download/v#{version}/Tilqos-#{version}-macOS-arm64.dmg"
  name "Tilqos"
  desc "Fixes text typed in the wrong keyboard layout: English, Russian, Kazakh"
  homepage "https://github.com/elapen/tilqos"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Tilqos.app"

  postflight do
    # Ad-hoc signed, not notarized: clear the quarantine flag so Gatekeeper does not block the first launch.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Tilqos.app"]
  end

  caveats <<~EOS
    Tilqos needs the Accessibility permission (System Settings > Privacy & Security).
    The build is ad-hoc signed, so macOS asks you to approve it again after every update.
  EOS

  zap trash: [
    "~/Library/Preferences/io.github.elapen.tilqos.plist",
    "~/Library/Caches/io.github.elapen.tilqos",
    "~/Library/Saved Application State/io.github.elapen.tilqos.savedState",
  ]
end
