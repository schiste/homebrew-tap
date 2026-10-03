# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.15/aethyme-v0.8.15-aarch64-apple-darwin.tar.gz"
      sha256 "b404034b89e966c72d1f0901e872f0541b898af27a7fb9d4691043c8f92ba2cd"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.15/aethyme-v0.8.15-x86_64-apple-darwin.tar.gz"
      sha256 "16a441f2f1ddc5345885d88b806fd9885fcd540b0857d04d77084184da0f604c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.15/aethyme-v0.8.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "319698a062826902458155d14ebb6a9060789b80289fa224bbb44577a93fcb4c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.15/aethyme-v0.8.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4de33af3886ed15d8fcbea54343338876ab527fda700d85d767e135a0ccbb2ed"
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
