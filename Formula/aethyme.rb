# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.83/aethyme-v0.8.83-aarch64-apple-darwin.tar.gz"
      sha256 "cfc2783be4a54c7ecb0ce944a0f692494b56c1a8bd3fd49863ed0b6e0b694dac"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.83/aethyme-v0.8.83-x86_64-apple-darwin.tar.gz"
      sha256 "7b0d7d874e3f8194301485e4b8d1bb826268dea8eef21e4e8557c06ab78d4236"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.83/aethyme-v0.8.83-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60b25e824541d58cf7b581bca97d4f0cf0610795efc4aed6b130a4d413fc22e1"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.83/aethyme-v0.8.83-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03b1de9901db485719d9805ae160786d6a9f72b74e542c0449db351d0d2e09c3"
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
