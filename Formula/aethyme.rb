# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.17/aethyme-v0.8.17-aarch64-apple-darwin.tar.gz"
      sha256 "ea7fff3d81e23e8c90b4e9429393bf5bbeae4e6478064ae47fa7659f35192fd9"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.17/aethyme-v0.8.17-x86_64-apple-darwin.tar.gz"
      sha256 "162b4b9b501f62e1f7223ba42621e4060a0ee7794d8224c1573ed90e3a5bc4e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.17/aethyme-v0.8.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2504095748bc9d939e92dcd9ddcafb0ec600371611af2ad8006607f4b6314f45"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.17/aethyme-v0.8.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18e780075af46c5b38c4befff1f7b72b763cac2c300ccfe849a17e9b7c9dafec"
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
