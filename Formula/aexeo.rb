# frozen_string_literal: true

class Aexeo < Formula
  desc "SEO and GEO site auditing CLI"
  homepage "https://github.com/schiste/Aexeo"
  version "0.0.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aexeo/releases/download/v0.0.20/aexeo-cli-darwin-arm64"
      sha256 "bb14907a6876f085106466397fc6bce78dc0cf9aa245b3e3f0f40f72af3d62b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schiste/Aexeo/releases/download/v0.0.20/aexeo-cli-linux-x86_64"
      sha256 "b56a45d33a114de028bd593641023ad622d053fbf5c4aa3d93b09844c34ba236"
    end
  end

  def install
    binary = if OS.mac? && Hardware::CPU.arm?
      "aexeo-cli-darwin-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      "aexeo-cli-linux-x86_64"
    else
      odie "Aexeo prebuilt binaries are available for Apple Silicon macOS and Intel x86_64 Linux"
    end

    bin.install binary => "aexeo-cli"
    chmod 0755, bin/"aexeo-cli"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/aexeo-cli --help")
  end
end
