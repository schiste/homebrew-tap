# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.138/aethyme-v0.8.138-aarch64-apple-darwin.tar.gz"
      sha256 "458a224f3df79a37c053d08c5497ea3aace25c0fa484b120c42fd028699e53ee"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.138/aethyme-v0.8.138-x86_64-apple-darwin.tar.gz"
      sha256 "6a474c33c21e43a8cea0051172d264ea16f7a91759c4febb58bbf4407d4e9123"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.138/aethyme-v0.8.138-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c03bc6871fbd21f5df48927ebf80b524a747353fa08a9cd9b5de15089fabd81"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.138/aethyme-v0.8.138-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d74643d24638e78f3f3711ce4009ec8de5ba7949f30e408b4eef749bfc4edadb"
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
