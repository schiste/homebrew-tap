# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.34/aethyme-v0.8.34-aarch64-apple-darwin.tar.gz"
      sha256 "5fb54f912da37d6388877471d11b7a336e746e05f114801e3fdaef4df59ab05a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.34/aethyme-v0.8.34-x86_64-apple-darwin.tar.gz"
      sha256 "1a78d9e551f487702ac0b08f28aeacb42053c0e2bef06f264f149cf942b94053"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.34/aethyme-v0.8.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d4e059f3b352db62f8c1299a2575f8870bfeed3d22e13019b89fe8e93f11a60"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.34/aethyme-v0.8.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03a1a2f3f2e340bc15fa54d801edcd0d1b6753822490006edd68e2c09e41205c"
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
