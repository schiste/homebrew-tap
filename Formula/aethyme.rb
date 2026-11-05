# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.59/aethyme-v0.8.59-aarch64-apple-darwin.tar.gz"
      sha256 "6f2250bcd390db18131767e09fe8b7e90f6dcb498fc57cc424ccf7886c8a86a6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.59/aethyme-v0.8.59-x86_64-apple-darwin.tar.gz"
      sha256 "425e39451b07a1e0a324aea367e8aaf6447668f5a552d21ed6b58aad8d206102"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.59/aethyme-v0.8.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2289bd404554b158bb59876ddc22a9a4423b5914cd0cb4f48019bbfffc6afa2b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.59/aethyme-v0.8.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "942f1867628d82a91cfcc9c6afc7e9329bafacd84eea408ca71c1d704f0be33d"
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
