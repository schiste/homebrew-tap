# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.88/aethyme-v0.8.88-aarch64-apple-darwin.tar.gz"
      sha256 "3dce51ca25554bb3a6abb7e833b1b426fe02ec577dc9acfb0105a167a3779d32"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.88/aethyme-v0.8.88-x86_64-apple-darwin.tar.gz"
      sha256 "ce979a5b5b5053850058be30f3b266b0852b09641aec7949c729033888865cea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.88/aethyme-v0.8.88-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "659fef19daa3d382e5775c006d9c1f3be1276cb35892ba367b0d8af3402899ce"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.88/aethyme-v0.8.88-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be4d3db01d2455c7b8f58acb0cedf63233f86102e7ba7fb6f5099f4e9adb6a5f"
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
