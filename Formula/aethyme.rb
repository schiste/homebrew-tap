# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.133/aethyme-v0.8.133-aarch64-apple-darwin.tar.gz"
      sha256 "e0a75bbdac4e54036d1d5442de99fe605d27c8d97d01198e0c82c6daee2955a6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.133/aethyme-v0.8.133-x86_64-apple-darwin.tar.gz"
      sha256 "1c9384169ae9211b2845d87c73d91fd4604cc1560b0e67249681696f56f5652d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.133/aethyme-v0.8.133-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0c1549d0ff9c9338d044a716cc6be5ade9e08bd927520dd334b7b7fb7355d29"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.133/aethyme-v0.8.133-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63ac21f22a318643c7725a6bc054d2af2b7eeb9cc29d3ada79a53e05f16f1c89"
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
