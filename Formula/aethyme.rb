# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.64/aethyme-v0.8.64-aarch64-apple-darwin.tar.gz"
      sha256 "cf3b66e901a30260410950a3ff6db13c62db8b7914177ee4fae1517b5d66078c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.64/aethyme-v0.8.64-x86_64-apple-darwin.tar.gz"
      sha256 "e6704c0e3f633ca8871effacaae6df6b4e27133f5871b6516b3770966b395013"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.64/aethyme-v0.8.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aabe2ce72d4f990465710dec72e9e9b2b9f0cd4632931534a862928deaed6435"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.64/aethyme-v0.8.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "707daad08903c81075160e4d781e4b620f34150e74d74cf8d8a98dc8eeb1dc9c"
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
