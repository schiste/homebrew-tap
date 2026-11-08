# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.65/aethyme-v0.8.65-aarch64-apple-darwin.tar.gz"
      sha256 "ac3f8eb336cdb11d7ebb3cc0f9aadd55d1c4c1f60657ee78527dabcd286469cd"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.65/aethyme-v0.8.65-x86_64-apple-darwin.tar.gz"
      sha256 "ab23c972df9f73d33e5edd5f829288956e3fd70f8c50529b48b0c890277ee431"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.65/aethyme-v0.8.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "909ec6c39ff9c6b6f13b4ec7afcf5e0174d899e49381cc90330b45cdcd9c48e9"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.65/aethyme-v0.8.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1217070592362543f87b956a15a9db984825686efd0ba1a45b67c55255764698"
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
