# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.40/aethyme-v0.8.40-aarch64-apple-darwin.tar.gz"
      sha256 "5e26b762ae142f23ed5f52cd71597205df50a6ebe1f923e31b0c013622ba7c9e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.40/aethyme-v0.8.40-x86_64-apple-darwin.tar.gz"
      sha256 "0aec3726af3590ce9f44d6a9c5a529274cfc1f9a834c507d8657255e1d5a177c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.40/aethyme-v0.8.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d520ff9c7697e3005096f548a45670bf710d7e1fffe3f2a3cd5fef07a12e0f0c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.40/aethyme-v0.8.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ca177100060a5ece127f525e5be0fc9018749d11449ec8ee5ced75e45d91917"
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
