# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.172/aethyme-v0.8.172-aarch64-apple-darwin.tar.gz"
      sha256 "d32ad63ee23b1cd453377cd109e91f7d15ce95930ca04d98a487a81410a3d733"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.172/aethyme-v0.8.172-x86_64-apple-darwin.tar.gz"
      sha256 "c71b1c1f61b9fe8001876f42a2d75a0c9b36bb32de995da7c3ed5f5b81364260"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.172/aethyme-v0.8.172-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd7fd3d20cf0b32253f770b96a39a0ea462022c8ea4665eed4d6fc58760cf33e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.172/aethyme-v0.8.172-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3e720877cd285fedd1f6bb3cc44162d865ae66877979ff2e56f1a0ea485398b"
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
