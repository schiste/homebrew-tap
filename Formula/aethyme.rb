# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.119/aethyme-v0.8.119-aarch64-apple-darwin.tar.gz"
      sha256 "0836da4397be6020c01cdf1b72a2ab92f6ce4145bcb66bbea57cbe27f784e955"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.119/aethyme-v0.8.119-x86_64-apple-darwin.tar.gz"
      sha256 "ad46af1845b55c9f4b96e45d4d50119132a1a2a64e6f4c76c233250c0ff2d32c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.119/aethyme-v0.8.119-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca71588a72c420c8425150305b4cd8800de06f8a5348e27fff88c9e95483da80"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.119/aethyme-v0.8.119-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed86876b4ac6ff08545ac6c873966dd9c0ea6f6fad274bbe7d2ff1d99d798980"
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
