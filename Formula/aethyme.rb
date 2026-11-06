# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.62/aethyme-v0.8.62-aarch64-apple-darwin.tar.gz"
      sha256 "2c2d8e5effba8cf983d410ff2a810b77e060e07909dadf1e3e8e43539f520447"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.62/aethyme-v0.8.62-x86_64-apple-darwin.tar.gz"
      sha256 "2359c4a7e95bcc0df99dcfa17f96aa46ea6cb1b25b383393d57a28a35b34963f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.62/aethyme-v0.8.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67ae116ef5ebc7969801dffdbbcbbc4efbea4645f3593bd16950bf16f942d6f0"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.62/aethyme-v0.8.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "200f17bf17fa4b2e5330433defc3e04b4e8a944ca7fee5d64e39df1ad4c047d0"
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
