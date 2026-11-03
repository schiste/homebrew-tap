# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.54/aethyme-v0.8.54-aarch64-apple-darwin.tar.gz"
      sha256 "55cfb2c21b3b5c116a3b402550e2406baa3027ed38262625aecca5e472613eb6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.54/aethyme-v0.8.54-x86_64-apple-darwin.tar.gz"
      sha256 "9193d092560d1836b1ea49417fcaefc7128d6114ddc791f9f2dddae83b9125ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.54/aethyme-v0.8.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe8c626657bc84805ff26878b196a2fa32755a40ddaf3a48fa6eb74489d95f63"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.54/aethyme-v0.8.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c4f93dc3fc078bdad3a0a009365d40382e1b4a122a0520ad529df967d494f86"
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
