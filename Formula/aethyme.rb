# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.3.0/aethyme-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "dc2a530276b25c3fce28c3d84c3919c3355adfd3d1c5a0f15aa772cd0a866164"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.3.0/aethyme-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "43dc073c2f9c35f137c4adbae09ff3a40c946df811a21fd81e3b952723b50c16"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.3.0/aethyme-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdf85e76a2516f6070b326a592696063c747e5c04eced7c1acaeb924f5ed466c"
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
