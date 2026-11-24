# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.167/aethyme-v0.8.167-aarch64-apple-darwin.tar.gz"
      sha256 "9f3dc9f57b74f364f161482138b6e7313ee511f2c3260aff22ba28300c3124b5"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.167/aethyme-v0.8.167-x86_64-apple-darwin.tar.gz"
      sha256 "ea9c08b1681e4f0453e6f04bfeb2c2322983f2f5e9b158a5ce7a5525e2cd8386"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.167/aethyme-v0.8.167-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ada95ad6098b44a46c6847040883621a1d67f2820ed7bc903c01e4bcaf67246"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.167/aethyme-v0.8.167-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cad53b153345a321da309e32fd87a4407069c8fcbdd1c2d8fe56bb4453114e07"
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
