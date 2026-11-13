# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.94/aethyme-v0.8.94-aarch64-apple-darwin.tar.gz"
      sha256 "2f0cfbfef2dc5be7f7517f25f76032d94972f7dbfcc81367a8f485c55c0a2ca4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.94/aethyme-v0.8.94-x86_64-apple-darwin.tar.gz"
      sha256 "b1af36fdeca60fb2cfa99449b86a8b474a0cb8096218e59591f6453b653d197b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.94/aethyme-v0.8.94-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "603a155989af583e19a76efa7293fd2efde786cd7f845a04994170a7747020a3"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.94/aethyme-v0.8.94-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ea6635a41c69ed0d8abc409ec4f727dc97a1582b3f2419a1edf908febd785e6"
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
