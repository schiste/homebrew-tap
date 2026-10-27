# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.38/aethyme-v0.8.38-aarch64-apple-darwin.tar.gz"
      sha256 "bc2bea1e0fa660f510502543ae23deb74868e17f12e13e4be45c2948e150351e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.38/aethyme-v0.8.38-x86_64-apple-darwin.tar.gz"
      sha256 "11732aaa3b8c103729485fd477ac11be703ef5fe561791e14637dce88354f3d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.38/aethyme-v0.8.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5bc89253ffdf9701991fb4ee02dc7df3d6138d1a2748bcf0b46b8fb33f37e627"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.38/aethyme-v0.8.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1693070cc019c28b1d85910346d64d9975569d035edd40518232ed5adc152e88"
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
