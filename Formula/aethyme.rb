# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.23/aethyme-v0.8.23-aarch64-apple-darwin.tar.gz"
      sha256 "cf9e1a8e5396cf3019f95a47c6632ea83ff302ca4708e29628e290f9ede5fc37"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.23/aethyme-v0.8.23-x86_64-apple-darwin.tar.gz"
      sha256 "8624334f2865b80a4559734341d4b5d39abb7bf6bf8430eeac44a9e483444a9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.23/aethyme-v0.8.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2c78d19f19bd658046c218aa9ebb11d2594b67dfe044c41aa07921636aee3f9"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.23/aethyme-v0.8.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb38ccf0d376fbadaf02e72e2bd9d99f1529ad3dccec5d10fce9de6db5fdcd28"
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
