class CodexMarketAt01 < Formula
  desc "CLI tool to manage Claude marketplace plugins for Codex"
  homepage "https://github.com/egoavara/codex-marketplace"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.3/codex-market-v0.1.3-darwin-amd64"
      sha256 "e8d6e489e31f6ac6e7348efd97aa4d8e739f4a38177d96a0726cfcd59780479b"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.3/codex-market-v0.1.3-darwin-arm64"
      sha256 "14f89e72aa69b0949cc832ea0818536f0ee6745ac5f4f6c0a445ccd62e12c373"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.3/codex-market-v0.1.3-linux-amd64"
      sha256 "e88a33348c0623a421bb11c8c38b9bf9060ba27e971a6d4f7948b4a53d4c769c"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.3/codex-market-v0.1.3-linux-arm64"
      sha256 "aa260cc13cb52b1542914a17f7fd8e6917dd1411cada36e2c776cc933ae65b4b"
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
    assert_match "0.1.3", shell_output("#{bin}/codex-market version")
  end
end
