# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.140/aethyme-v0.8.140-aarch64-apple-darwin.tar.gz"
      sha256 "fd9eb11ef0a39fcc483f60ae9cc2171640c4fb805e9bb680df15e2bde953c529"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.140/aethyme-v0.8.140-x86_64-apple-darwin.tar.gz"
      sha256 "98fd0a5dd329aa412b965d147c665ce6fdbc9b25263f63569320e8feedc7e2e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.140/aethyme-v0.8.140-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80d6366add0b11ef0a0a9d3b189408b47596b24f439cdaeb14b1161fc23f50f1"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.140/aethyme-v0.8.140-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "503609f55f5370dfeceee55af2b3a52058508e1eef69a2af1e3b07eeac1bebd5"
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
