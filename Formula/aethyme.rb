# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.56/aethyme-v0.8.56-aarch64-apple-darwin.tar.gz"
      sha256 "bf01023325f37d663f9864cf974d814ae42038d1c5ed957daf59e9924ce73b60"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.56/aethyme-v0.8.56-x86_64-apple-darwin.tar.gz"
      sha256 "4c85f4e6209e66bf8ebeaea5e13ce7b4d44f5072290a356d6856708c428a6113"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.56/aethyme-v0.8.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "98a1c6a9a241b817b56d655d9c4db9f3bc4a52977b089e4fc7f9e1741d3cd7f6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.56/aethyme-v0.8.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2266789f18f4de6f79d569c8da20abe06e53c026ed6a6fcded0d864bcafc322"
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
