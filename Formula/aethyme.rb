# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.188/aethyme-v0.8.188-aarch64-apple-darwin.tar.gz"
      sha256 "b66e0fa0f4d3948d4df0c496c2e7014f88dac2967a2f678ef3c23eb4aaf0bceb"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.188/aethyme-v0.8.188-x86_64-apple-darwin.tar.gz"
      sha256 "63d6f0196e8f1b5fe5bc500a4069dfb67a2afa2dfeaeca38e4925cb89ae99f6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.188/aethyme-v0.8.188-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f988faa01207cb211cc9d8b3203c04a7b67dfdc6d690bcfbea8f7109ca9a69e6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.188/aethyme-v0.8.188-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb0608e5beb83c08509a6a5d7f6cac10a5c9daefdef28371f4654850d65c0625"
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
