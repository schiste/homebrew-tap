# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.186/aethyme-v0.8.186-aarch64-apple-darwin.tar.gz"
      sha256 "df894823259c1fd62fc451e27f976ff3dd7059a16f055edc36a8b68e2e2f610b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.186/aethyme-v0.8.186-x86_64-apple-darwin.tar.gz"
      sha256 "0eab7531374d8a134bf00e1ec914b63abb3c6c5d11c6ca30f5d20c6afd022efc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.186/aethyme-v0.8.186-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0060cb056c26cc96c7bbf475f31fce862b379545c3a1b044f565163e788ed9ae"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.186/aethyme-v0.8.186-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10a1d42c0d11aa0dce843ec84515b48383a100e9f2fbd470c5958cca856c56fe"
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
