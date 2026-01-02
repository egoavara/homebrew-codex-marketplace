class CodexMarketAt020 < Formula
  desc "CLI tool to manage Claude marketplace plugins for Codex"
  homepage "https://github.com/egoavara/codex-marketplace"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.2.0/codex-market-v0.2.0-darwin-amd64"
      sha256 "d89d0230fb9934f7107e559c8d6f32674e0c0f9af1d846deee5eca3764dddeb4"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.2.0/codex-market-v0.2.0-darwin-arm64"
      sha256 "e9f6e192fd13ab47193f726bf57e5a10f869e36004e69dad5a7c923c1a0e0c18"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.2.0/codex-market-v0.2.0-linux-amd64"
      sha256 "e91d8f132e77ec9d850fc252da7fe6ff4f86bfbfd241eb2aa4a774c7cfdceef5"
    end
    on_arm do
      url "https://github.com/egoavara/codex-marketplace/releases/download/v0.2.0/codex-market-v0.2.0-linux-arm64"
      sha256 "8e9852981394cea78ea37139a4864f758a43d89ab27e61e48fdbb6f4ae09cd4b"
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
    assert_match "0.2.0", shell_output("#{bin}/codex-market version")
  end
end
