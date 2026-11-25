# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.175/aethyme-v0.8.175-aarch64-apple-darwin.tar.gz"
      sha256 "7876a6bf8642d58e394c75fdcc95fffb6a7e117657d9e60dc3fee1aefdccc9aa"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.175/aethyme-v0.8.175-x86_64-apple-darwin.tar.gz"
      sha256 "e6cff8f2d264956963187c42e98dbe95cc475e13c273f3a64dda2cdfff71b90b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.175/aethyme-v0.8.175-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1db80180332bd1232b5ad0fcda4e42c1e9197469ed636e0ecfbcfe5c37941df7"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.175/aethyme-v0.8.175-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2ed3c92e3966ce519e4de0864f2bc8acbeceefe54dab82897d0a462c1edf864"
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
