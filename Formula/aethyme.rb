# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.16/aethyme-v0.7.16-aarch64-apple-darwin.tar.gz"
      sha256 "02c9666bbddce4a18e851a5b1bacc7dde1b307a65f5703359f099ef1613d4d57"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.16/aethyme-v0.7.16-x86_64-apple-darwin.tar.gz"
      sha256 "c516b1adbed31e9a0f7d03c30345f44a0ee6a08d3bfd041a505e7d2b41d2d15e"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.16/aethyme-v0.7.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e33ef5700230a143202bb282ecce43afaf57cda8a12f5d7f09b1b8662411aa56"
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
