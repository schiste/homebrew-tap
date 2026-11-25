# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.173/aethyme-v0.8.173-aarch64-apple-darwin.tar.gz"
      sha256 "d327ff12840ce848f6f74931d3413a3a354d5d13ae5a5ef9a9dc923969555883"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.173/aethyme-v0.8.173-x86_64-apple-darwin.tar.gz"
      sha256 "96bf3460dc66d13a3b6da4c13363700ec73ae36c3d45ad08ae37e140468483e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.173/aethyme-v0.8.173-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6600d77d86a1438ef554b9ffb414fc2a4762b256b0068e250e64c3e192cba379"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.173/aethyme-v0.8.173-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b42f5c0042e41b165b16d55cff83420575b5b3aa23757822ad5d1fa6e58885b"
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
