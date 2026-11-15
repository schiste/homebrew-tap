# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.100/aethyme-v0.8.100-aarch64-apple-darwin.tar.gz"
      sha256 "8ad47e28eb924730ac605f0a577b5cdad3d3976567c8b9db54d3033e0c006c48"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.100/aethyme-v0.8.100-x86_64-apple-darwin.tar.gz"
      sha256 "e375ab7db35b5d7bb39245417a96ef2410605e44faf4757da746b33431a596f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.100/aethyme-v0.8.100-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d67f54b346d506417727d677c132ee283f37f0ca40f1ef3f1adc57b30958043b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.100/aethyme-v0.8.100-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "939cc312d1f75376aedb34cdf9e12ea838f0b53e11dc97d546d65976765ee02e"
    end
  end

  def install
    bin.install "aethyme", "aethyme-engine-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aethyme --version")
    assert_match version.to_s, shell_output("#{bin}/aethyme-engine-cli --version")
    system bin/"aethyme", "broker", "quick-test"
  end
end
