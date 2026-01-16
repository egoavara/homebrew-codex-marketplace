class CodexMarketAt04 < Formula
  desc "CLI tool to manage Claude marketplace plugins for Codex"
  homepage "https://github.com/egoavara/codex-marketplace"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.4.0/codex-market-v0.4.0-darwin-amd64"
      sha256 "af5e6497439f9e0a47bd2cafda141c1d36b5625be08ccc22f461e2fe57de7827"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.4.0/codex-market-v0.4.0-darwin-arm64"
      sha256 "15decef9c4b3e7f85db5fdd8a8fb749f37aef14bbb546f49493675619399de82"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.4.0/codex-market-v0.4.0-linux-amd64"
      sha256 "a8cff5591c6306cd55a5ffa63e0602ff9f85ebd483d86586b4b27d2962c788b3"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.4.0/codex-market-v0.4.0-linux-arm64"
      sha256 "e32808b6d0fc6f6b785d6ff3fce568935c084474ab9ee163085c992fbdf2879b"
    end
  end

  keg_only :versioned_formula

  def install
    binary_name = "codex-market-v#{version}-"
    if OS.mac?
      binary_name += Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"
    else
      binary_name += Hardware::CPU.arm? ? "linux-arm64" : "linux-amd64"
    end
    bin.install binary_name => "codex-market"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/codex-market version")
  end
end
