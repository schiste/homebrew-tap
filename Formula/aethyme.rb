# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.176/aethyme-v0.8.176-aarch64-apple-darwin.tar.gz"
      sha256 "6c10388d96182dc59718d12122520d03068cbb6ba8a4012f1df7a1894cfed55b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.176/aethyme-v0.8.176-x86_64-apple-darwin.tar.gz"
      sha256 "0114e73430f819cf51e4a1326f1d31a1766f96695691b47b650ce682528f568c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.176/aethyme-v0.8.176-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91b0d19d0ed088d0d7d6bdae9f984aeded78266999f5c586e383f22349705fed"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.176/aethyme-v0.8.176-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b99d004ab8001a5e4a8affafe9eacba8194d365ec2c9b0750b7cc492ba1d6a4"
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
