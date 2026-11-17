# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.114/aethyme-v0.8.114-aarch64-apple-darwin.tar.gz"
      sha256 "9e6ccf9469451676b5a122f27aea0d40befcf83488c35b59cabc569e49e36a60"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.114/aethyme-v0.8.114-x86_64-apple-darwin.tar.gz"
      sha256 "9490946241ded2c028158a9d639e2138a878b69809c26ebf3260df00fd429ce7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.114/aethyme-v0.8.114-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48ef0a1c54f098d7dc489dc5337347ee9eeb0542787466f97a6d64fe519c65c6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.114/aethyme-v0.8.114-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74abd6c3b7069f62f3147c3947f3ea5ac7283a50095aa7cf6ffa21e52c0334b8"
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
