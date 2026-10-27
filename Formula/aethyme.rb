# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.35/aethyme-v0.8.35-aarch64-apple-darwin.tar.gz"
      sha256 "a13d2fdeb05159d581a94c5a064d7e11f68b91ff0d1be1af072cca2844b1792e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.35/aethyme-v0.8.35-x86_64-apple-darwin.tar.gz"
      sha256 "3daad4f7bada4bb55888e0fdb8b5ae7d8b7355d6255ddbce30ba6f31fb675444"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.35/aethyme-v0.8.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5050596ca445357d3940f56fdc42538612e2882d242a75aa8a3009562cb3ad4b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.35/aethyme-v0.8.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a4a14fb7a4e26394d54940647aff55bc27f81765d0600218d8caf693521d0ae"
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
