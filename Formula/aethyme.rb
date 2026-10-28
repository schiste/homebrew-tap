# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.45/aethyme-v0.8.45-aarch64-apple-darwin.tar.gz"
      sha256 "00f741a9cd9a764bcbbc0111359d78f841ed8b24cf8da4b1a4c699440a7d8ecd"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.45/aethyme-v0.8.45-x86_64-apple-darwin.tar.gz"
      sha256 "0936c0295b19811a55b60bde892d271e34de840e26c2b7afcc1550b69cba51b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.45/aethyme-v0.8.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c4f6119e563ef8130a5e6725bdfd76c019610fe8f1a50ec4bbb76a6b831c300"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.45/aethyme-v0.8.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e2356f2096e84a94a8a45e1ee8c34673e55334433c1093e11a2d2ddf6b7bf50"
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
