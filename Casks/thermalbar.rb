cask "thermalbar" do
  version "2.0.0"
  sha256 "e3ba880af7b88ae0a5046e2a24be57e197549545eb62dbcaa8b21e9693972f6b"

  url "https://github.com/evilork/thermalbar/releases/download/v#{version}/ThermalBar-#{version}.zip"
  name "ThermalBar"
  desc "Menu bar monitor for temperature, power, memory pressure and throttling"
  homepage "https://github.com/evilork/thermalbar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ThermalBar.app"

  uninstall launchctl: "com.evilork.thermalbar",
            quit:      "com.evilork.thermalbar"

  zap trash: [
    "~/.config/thermalbar",
    "~/Library/Application Support/ThermalBar",
    "~/Library/Preferences/com.evilork.thermalbar.plist",
  ]
end
