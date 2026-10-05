# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.20/aethyme-v0.8.20-aarch64-apple-darwin.tar.gz"
      sha256 "71b636ef78f8c7f7fd89f3d4eff65d7f07045ffcf45265610a8b77147b53dcc7"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.20/aethyme-v0.8.20-x86_64-apple-darwin.tar.gz"
      sha256 "9fd492ebbd0b39bedfa47a018310b5d92c72c3beb71f5fdb75769eb55df414fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.20/aethyme-v0.8.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f79775197c474c8b4a3834446c5471db0d2e332e9ed9570af0db9fc695a2912"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.20/aethyme-v0.8.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d8d46d3dbac308ffcd3c2fee96fae7b94670fe333936c77ea7789ffffc457fa"
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
