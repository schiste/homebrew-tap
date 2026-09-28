# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.7/aethyme-v0.8.7-aarch64-apple-darwin.tar.gz"
      sha256 "f7b87f3ac3e37cd506a9b6fdb2d0ea5ae0507d3a98ce337c634fbbc409435f39"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.7/aethyme-v0.8.7-x86_64-apple-darwin.tar.gz"
      sha256 "5e28a7f6275ec90225fb934d090b2bd33a739a1a60c59c23c480fdb26a93d986"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.7/aethyme-v0.8.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "363386b4166f71288bc5fe7992e7bc60706eb79f8566c8ee38d5cd48a58a4577"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.7/aethyme-v0.8.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65cb07881def6a7f631d7e341369a4e65c3eb1d1176cabece84939d62cfefbfa"
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
