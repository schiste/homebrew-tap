# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.23/aethyme-v0.7.23-aarch64-apple-darwin.tar.gz"
      sha256 "7fa0bcb7d660e7391e6db6ccb798756c61636159d51a9112933a80b3799618c9"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.23/aethyme-v0.7.23-x86_64-apple-darwin.tar.gz"
      sha256 "e35ca290db16da867f4bafbe288f37985b12c4fcf825a019da65192610ab8c6b"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.23/aethyme-v0.7.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1535442653356db66a6f5e07afdea4a373d3228bce8cb12edc6bdd81b072f58a"
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
