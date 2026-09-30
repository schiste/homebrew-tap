# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.11/aethyme-v0.8.11-aarch64-apple-darwin.tar.gz"
      sha256 "4bc50fe55592f70be8e2a0e11c2af60aadbfa202bbdb55f73996746bbe071075"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.11/aethyme-v0.8.11-x86_64-apple-darwin.tar.gz"
      sha256 "2b7343c431439a74822977138fd1c142020567f318bdb34d64fc7f6d062eedfc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.11/aethyme-v0.8.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ce209280635990ceea2507efb29f3bf6951b38cb7b950d9a0c389b669df52d8"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.11/aethyme-v0.8.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e415254444325e3624161a31600f9f013c86b9f78cb1302b8f780fc627f56440"
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
