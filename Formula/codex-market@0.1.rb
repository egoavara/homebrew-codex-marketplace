class CodexMarketAT01 < Formula
  desc "CLI tool to manage Claude marketplace plugins for Codex"
  homepage "https://github.com/egoavara/codex-marketplace"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.0/codex-market-v0.1.0-darwin-amd64"
      sha256 "96abfdcc715ac5d3f5887353ee0f48bf5145adbcdde914eed32e8af056b75cc3"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.0/codex-market-v0.1.0-darwin-arm64"
      sha256 "9f1bab696dbd3b4c1938b0ab6d64316bbba1ecac18267062c8384dfb8f1fe8eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.0/codex-market-v0.1.0-linux-amd64"
      sha256 "b4f82977a8894e1e716d394a11951601f0eb67e80f62f9b9780b32c23da561e9"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.1.0/codex-market-v0.1.0-linux-arm64"
      sha256 "df6300bb979b9527d11943520cb5619c5fb9adcdac8391e36dbd443fe9858b9d"
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
    assert_match "0.1.0", shell_output("#{bin}/codex-market version")
  end
end
