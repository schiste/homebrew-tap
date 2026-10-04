# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.18/aethyme-v0.8.18-aarch64-apple-darwin.tar.gz"
      sha256 "f1e7a41c73599c1e26c8387b445a5d953fd0ad4f31e05ccd106bac43de888537"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.18/aethyme-v0.8.18-x86_64-apple-darwin.tar.gz"
      sha256 "db786624942d5b95545a8542d3815bb8f066040f81cb4698e29bd4bcb0a6e5ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.18/aethyme-v0.8.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21ed1a77100fab55ca7d2ca6ace0d3a38cd673d62ea5a7d6bf71b29f6e4d5428"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.18/aethyme-v0.8.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5cf97796794e62e3536172ba5268e35ae79059bed12b79cc7787ce6502c6d85"
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
