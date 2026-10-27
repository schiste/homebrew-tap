# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.37/aethyme-v0.8.37-aarch64-apple-darwin.tar.gz"
      sha256 "6a48b675f5ac72c881452ab95bb4fdf9f05392b1998a784b4f4fb9e0ec2985f1"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.37/aethyme-v0.8.37-x86_64-apple-darwin.tar.gz"
      sha256 "80a8ee41eff792a64eca4e63e47cd1a2dc7dcecdc4d8c4e3f06625c3e2ffe8e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.37/aethyme-v0.8.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47deeaa89713c2b2fe9be98ab81692e2622ce2995d36e4a47ac06da72fadcdf9"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.37/aethyme-v0.8.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9785bf03d9e466ff9914628493fa5e439df6affe9ae9da4249773f6d96b443f0"
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
