# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.58/aethyme-v0.8.58-aarch64-apple-darwin.tar.gz"
      sha256 "e3ae6ff31a4a046f2a7b875d420a0ca7d78e7313829f7218174a97faa186ef19"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.58/aethyme-v0.8.58-x86_64-apple-darwin.tar.gz"
      sha256 "e054dbaeb30978f5296c9f65748c8e63e3d1ead8d9b8bcc9c29f31f33470f4f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.58/aethyme-v0.8.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72b765f638f88ac53626ea0f6c93dfafc700405d297e02d5c2c33f9293089614"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.58/aethyme-v0.8.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d580ce428452da57f6dd39b7b3da03ad16bbb498a7260f902e9e7dc1c775065f"
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
