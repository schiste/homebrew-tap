# frozen_string_literal: true

class Aexeo < Formula
  desc "SEO and GEO site auditing CLI"
  homepage "https://github.com/schiste/Aexeo"
  version "0.0.26"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aexeo/releases/download/v0.0.26/aexeo-cli-darwin-arm64"
      sha256 "5bcd228f5e8fb1f4a533e978af153d1eac52f61bbe184d5a2498f6f8044d1112"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schiste/Aexeo/releases/download/v0.0.26/aexeo-cli-linux-x86_64"
      sha256 "651789b387551dcc1f3c330932ca3a679460bdbf08da0da70d9d0222d28ed087"
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
