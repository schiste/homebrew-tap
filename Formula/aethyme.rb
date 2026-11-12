# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.76/aethyme-v0.8.76-aarch64-apple-darwin.tar.gz"
      sha256 "246820675b22d26a7336419c5ad37a0456ef2df595a1ee6a37c8d197b1999997"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.76/aethyme-v0.8.76-x86_64-apple-darwin.tar.gz"
      sha256 "6ac6e76ce91974e56443fbf58bd9d0621027cc0386b1aa47ce628e0e14dcbb80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.76/aethyme-v0.8.76-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c0daabb1eb754d66bc9d13233759bd74ab7ebd3c2c2d3c023424797862f03e25"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.76/aethyme-v0.8.76-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82805087fbede63c67b615f3dbff37649afab5154c60ea6e0e3889c5244d1fed"
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
