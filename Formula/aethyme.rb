# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.190/aethyme-v0.8.190-aarch64-apple-darwin.tar.gz"
      sha256 "5e85947b4b67dfee47a93224cf8e8b5c1ab574aa692428be51480e69510a329a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.190/aethyme-v0.8.190-x86_64-apple-darwin.tar.gz"
      sha256 "7c5d9a4c7ade5b3ea5d10357b89186c591b9396c8114edf9824d837cd58f1f17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.190/aethyme-v0.8.190-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe45e892642e8315953c86d37732785bed721352afd91edf6f9b73159c4da0f5"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.190/aethyme-v0.8.190-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "227e852974b4ced3480d3cc40ca874233483308b0e0680860c919be7b1f99422"
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
