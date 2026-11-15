# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.102/aethyme-v0.8.102-aarch64-apple-darwin.tar.gz"
      sha256 "6254a7c0a752777d083536018003ed786783a94ac8d475b406e9f142cff17b9d"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.102/aethyme-v0.8.102-x86_64-apple-darwin.tar.gz"
      sha256 "fd79db3d6d9d081de0b9c7e8316bce80d73e6f5b1ea8d8a3064981b3636a1723"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.102/aethyme-v0.8.102-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "642f9c6b6d17dc325611c5e2dfd12118c9754f0832153174af463d1ed87e0cfa"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.102/aethyme-v0.8.102-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6af553179ba6d9ab7ce366ad3764ea9af7319aff38210f7e50150da1a287dfa1"
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
