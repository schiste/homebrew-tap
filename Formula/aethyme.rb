# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.80/aethyme-v0.8.80-aarch64-apple-darwin.tar.gz"
      sha256 "06d2e41e872bc7d7f876f3ba349f6f72731f1895b390354dece725ea25043b4d"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.80/aethyme-v0.8.80-x86_64-apple-darwin.tar.gz"
      sha256 "d31f38dc99915436165118ce11e2f21e2bf69425ec168671b3a8c35f30856e8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.80/aethyme-v0.8.80-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6f9b538d9436fec27ac6be2d93d8a1ea2578efa804d4e3a2c880d55d9627cab"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.80/aethyme-v0.8.80-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "640cd86d153259ca8660ee927394851eb1fe15035a09f694a0bb340e28e8aec3"
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
