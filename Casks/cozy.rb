cask "cozy" do
  arch arm: "arm64", intel: "x64"

  version "1.9.2"
  sha256 arm:   "cdef1343514e11dc334fc96324dd2b3bffbc8b30389352082a9771d31500b347",
         intel: "cc720692cebef81546506d4bd6ebe98be8b5c599c862d6219f0fee48b49767fc"

  url "https://cozyjournal.app/downloads/cozy-#{version}-#{arch}.dmg"
  name "Cozy"
  desc "Private journal that keeps entries as plain files on disk"
  homepage "https://cozyjournal.app/"

  livecheck do
    url "https://github.com/albertogalca/cozy-releases/releases/latest/download/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :monterey

  app "Cozy.app"

  uninstall quit: "com.cantimplorastudio.cozy"

  zap trash: [
    "~/Library/Application Support/cozy",
    "~/Library/Caches/cozy-updater",
    "~/Library/HTTPStorages/com.cantimplorastudio.cozy",
    "~/Library/Logs/cozy",
    "~/Library/Preferences/com.cantimplorastudio.cozy.plist",
  ]
end
