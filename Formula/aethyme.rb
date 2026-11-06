# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.60/aethyme-v0.8.60-aarch64-apple-darwin.tar.gz"
      sha256 "5f59e043f9203bb47c6c410629ab7371e591797620d7970d0c226fedf7d14118"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.60/aethyme-v0.8.60-x86_64-apple-darwin.tar.gz"
      sha256 "131c4090a41a3aa4b2c23642621714deed2f010995e818fa33f825b31855a21a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.60/aethyme-v0.8.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa525eff1d55a9af53c7f157af85336d276b087f759f5d681eeebb713f50efeb"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.60/aethyme-v0.8.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e35b14e58eccd6c42f5cfe7c7cc2d06e23f2632e70c37670eb40df77505b3184"
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
