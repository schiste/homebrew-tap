# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.152/aethyme-v0.8.152-aarch64-apple-darwin.tar.gz"
      sha256 "e0607c0bda52f271ae1aff4febcf4955b0b1ca12113f511f017fb9522e9f21d0"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.152/aethyme-v0.8.152-x86_64-apple-darwin.tar.gz"
      sha256 "7a3a77e1ec635d5d0ff561e2ae49aaba77e900aae72935024abc1fc1bc30b811"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.152/aethyme-v0.8.152-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4e9d1eef2c88243bf1ab24d922400dab033abf712388a68e162a6df90a0cd4d"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.152/aethyme-v0.8.152-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "664db49613152a68df36a9aa3dcfe29359fa6613a20bbc5a83af21a44a6fc53f"
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
