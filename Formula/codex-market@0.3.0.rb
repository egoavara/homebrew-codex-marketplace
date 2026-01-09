class CodexMarketAt030 < Formula
  desc "CLI tool to manage Claude marketplace plugins for Codex"
  homepage "https://github.com/egoavara/codex-marketplace"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.3.0/codex-market-v0.3.0-darwin-amd64"
      sha256 "ccad7c6e361ee558df185d29f9d3598fd33fd2da4f2ba68cbb42a2016de56d77"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.3.0/codex-market-v0.3.0-darwin-arm64"
      sha256 "64e2a7fcd4826dac10d7dc6e991bb87fd17351f8a29471934f1d621386ffb124"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.3.0/codex-market-v0.3.0-linux-amd64"
      sha256 "aa5586a7b49433c4e1e30a849ff9f53171c81227399fec22308928bab5242192"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.3.0/codex-market-v0.3.0-linux-arm64"
      sha256 "ff4ac5d05407ae3a6ac8e46e9134e233d2c2ab75788a3d707bc4cbccbf5585d0"
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
    assert_match "0.3.0", shell_output("#{bin}/codex-market version")
  end
end
