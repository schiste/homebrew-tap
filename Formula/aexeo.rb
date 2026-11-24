# frozen_string_literal: true

class Aexeo < Formula
  desc "SEO and GEO site auditing CLI"
  homepage "https://github.com/schiste/Aexeo"
  version "0.0.25"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aexeo/releases/download/v0.0.25/aexeo-cli-darwin-arm64"
      sha256 "eb6173315aee2afd9fe8af3dc600ccc6e709e98a2d31c8873c9189d7b35f033a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schiste/Aexeo/releases/download/v0.0.25/aexeo-cli-linux-x86_64"
      sha256 "d97822fa9de9674138b4914737d8e85d2d8a0acd58102a493caac67862c737aa"
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
