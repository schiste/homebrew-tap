# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.89/aethyme-v0.8.89-aarch64-apple-darwin.tar.gz"
      sha256 "2d978bafabf05eb7590b74d5c36c21f435631dc7efcb2697036d4d2df7db364d"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.89/aethyme-v0.8.89-x86_64-apple-darwin.tar.gz"
      sha256 "39efc0858efcd0240407953e79d548fb5c9e12fbd3e52f564d75e9adfeeee563"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.89/aethyme-v0.8.89-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9986138159025df302f7d41d8f6ba066365ad2664f6118afd45c6f7d930d1e4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.89/aethyme-v0.8.89-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ccc8d2123ff5040c9c16ebe791c5d88e227fdfde1c2d701c8a065b0dc9817ab2"
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
