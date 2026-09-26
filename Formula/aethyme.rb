# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.6/aethyme-v0.8.6-aarch64-apple-darwin.tar.gz"
      sha256 "7de9a2b14c625fd785014ce9640fe955e20af0bc309fbf052e0c0dbb46f11aad"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.6/aethyme-v0.8.6-x86_64-apple-darwin.tar.gz"
      sha256 "554c7617cc5d5af1f01e3f1de8c5fb1cf9077ef063e5244c9d3f7beeda34bdb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.6/aethyme-v0.8.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d757db6991c33e644500640d0be8943af3b59bd7f1765a8178c1a4695c96a82e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.6/aethyme-v0.8.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81d011deb8ff8c71b3af7822099720aad8a9cf03116ddd9689172011cea9a0a3"
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
