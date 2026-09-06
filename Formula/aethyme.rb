# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.11/aethyme-v0.7.11-aarch64-apple-darwin.tar.gz"
      sha256 "e515eacd2245056d087c2325b2aba261d5dfb533a8920ce81c3a9b3aabc76bf1"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.11/aethyme-v0.7.11-x86_64-apple-darwin.tar.gz"
      sha256 "9b3bd4f88b097b61ffe8b5b6a1723da7cdf066600809cb235f0f9e57d6069b59"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.11/aethyme-v0.7.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a660123d993cc99d8369f4e75e35ac0f802983839f2551117161b50b435cbcff"
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
