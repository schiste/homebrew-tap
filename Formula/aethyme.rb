# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.4.2/aethyme-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "0fbee89e44ecccb8694e6d0a09fe3601acc3fc3f1ffc8c2f0175f23fceabb3f4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.4.2/aethyme-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "858337b606369fc99f33337c58e181f2690ecc45d724c4e4b6fb8f41384c8287"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.4.2/aethyme-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99d07b113df7fd888c28857170e683adbfde60aeac08809d92b7a993cd011b39"
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
