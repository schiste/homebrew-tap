# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.160/aethyme-v0.8.160-aarch64-apple-darwin.tar.gz"
      sha256 "dd8920d6d02ff4ad97a0c5a9acce0d87b5f6ba13793e9136fbdd13f1a6afd367"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.160/aethyme-v0.8.160-x86_64-apple-darwin.tar.gz"
      sha256 "5cf07d4027ab87ae2bbca921c87f42d5a60db922e685a0107450948d22718e80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.160/aethyme-v0.8.160-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7970244772ce173e3c6f3ca007275e36d63aef5bc3ba8b676f31731593b0f6d6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.160/aethyme-v0.8.160-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dac0487899bed1da4c6780fc923b352ae0a3dda95ae5f6d044bfa08541afa3c9"
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
