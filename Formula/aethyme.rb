# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.156/aethyme-v0.8.156-aarch64-apple-darwin.tar.gz"
      sha256 "478f745c817081fac5c221e1d6bd844e0172e65e18339c04f4dd6fd323bdca8e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.156/aethyme-v0.8.156-x86_64-apple-darwin.tar.gz"
      sha256 "3fe34b539530b38a12fe780ca64b6fde765112dd5dc5019e21f8a2ae6a57e9df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.156/aethyme-v0.8.156-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5a95487cf0fedb7c58ceaf790cc2fec5d2c2d93fb3aa7f33665c6656841b34a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.156/aethyme-v0.8.156-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9bab10d0489efd7fbcc01bb499a4b533650e3bfa400d84dd4d82f30078c2f03c"
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
