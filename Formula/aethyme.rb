# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.5.0/aethyme-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "611fc5808fe118a6581567b1094879869c6d6a3a959aae4107bd8a7cb3c08dcf"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.5.0/aethyme-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "60feb68dfc0c7f9b6af1b2426550423fa11e1d8ebb42e95bc1156fe3ec623f04"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.5.0/aethyme-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65ec54fc7a83db37b6b762adf67611cad9133b259f58f0737c5fb0039c418e41"
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
