class CodexMarketAt01 < Formula
  desc "CLI tool to manage Claude marketplace plugins for Codex"
  homepage "https://github.com/egoavara/codex-marketplace"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.4/codex-market-v0.1.4-darwin-amd64"
      sha256 "37fb76ccc2b91e40a854473a03f06533c72c788fa35ba7b8a8593a0caa1e8f01"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.4/codex-market-v0.1.4-darwin-arm64"
      sha256 "dcf015058d0d2f8770615ebbe9b70bac6015edfa59e212753e850038af1aad41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.4/codex-market-v0.1.4-linux-amd64"
      sha256 "9b2a727284d5d1315fccc11b27f01b3d6db4288c1481be8a3a68a2c0b6f21d64"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.4/codex-market-v0.1.4-linux-arm64"
      sha256 "481cea823ea501b5e2f869f8dc72719fbc7cc46d28b2d1089f033b7ff7389da3"
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
    assert_match "0.1.4", shell_output("#{bin}/codex-market version")
  end
end
