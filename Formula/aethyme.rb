# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.108/aethyme-v0.8.108-aarch64-apple-darwin.tar.gz"
      sha256 "d8ab8f2e58046202a22fd4768672fd919da563ca4e8829acbcd302bbc10be0e6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.108/aethyme-v0.8.108-x86_64-apple-darwin.tar.gz"
      sha256 "ae21dbba4bbfa1d018f950dd7c7df9136fa1b3dc661c9739ce3f19d49753bd19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.108/aethyme-v0.8.108-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ce4dea6fec736167252e139dd3004ccada21fc448ea7a5bc609b9abc2c81d73"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.108/aethyme-v0.8.108-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6035d11dcdf0d75a471e04907146d03daf09285db340b5b65537828902c1773a"
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
