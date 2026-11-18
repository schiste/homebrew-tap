# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.130/aethyme-v0.8.130-aarch64-apple-darwin.tar.gz"
      sha256 "081120504a944cd449ba512f574fd8ce2816bf9e67b012297ea406659fe96f8f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.130/aethyme-v0.8.130-x86_64-apple-darwin.tar.gz"
      sha256 "130474a93847fa90ccfb1617aea9d08312f2ae05fcebc8c80e65a0ed6df9f6f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.130/aethyme-v0.8.130-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "700c91abfa8e0a4963da3052f426c020b30c35ae7c8a61df4f3c9a97dc75fa58"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.130/aethyme-v0.8.130-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "355cf7e8ea054ce0ef591124ebc374734f2f8c04b4f9124dee44a3a15c046f8d"
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
