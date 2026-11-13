# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.93/aethyme-v0.8.93-aarch64-apple-darwin.tar.gz"
      sha256 "a8fba1faf7d0190810ef0377a4c8a7ff9040b74170fe5ee3adede05694fe5111"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.93/aethyme-v0.8.93-x86_64-apple-darwin.tar.gz"
      sha256 "133fcfa360f4bf17a7090a39537ba79dd852e4ab8259c24fb0ac1ce4af811476"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.93/aethyme-v0.8.93-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fee1eb80df0337f242e5c2b493f4a650a75430368e097cec29f0e5cfcb8a54fd"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.93/aethyme-v0.8.93-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce16623e7e53f187c1b410de2961a3593e8ae8aa9c7a85553d809a659293635d"
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
