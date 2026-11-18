# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.128/aethyme-v0.8.128-aarch64-apple-darwin.tar.gz"
      sha256 "c63e149b2028481af6c691d7e1f646703b219b409eba95aa051aeea0bf182376"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.128/aethyme-v0.8.128-x86_64-apple-darwin.tar.gz"
      sha256 "665939adf89f51fdb5a92cf36f6dc7d81d5939c4a8854f6604d6d0596f83dfba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.128/aethyme-v0.8.128-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f74d402e3dc1a29adba998f2080216dfa5a7562737d401519b0106d9da5eacee"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.128/aethyme-v0.8.128-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77dd82ca3de1a1ef4a038cd411e48e1cbc9290bfc2cfff7a084afa359ec9b501"
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
