# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.129/aethyme-v0.8.129-aarch64-apple-darwin.tar.gz"
      sha256 "a094533ce08a7433481fd75a158b1ec0b824203654f493e6ca6c23239b45748e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.129/aethyme-v0.8.129-x86_64-apple-darwin.tar.gz"
      sha256 "8a3caf88fc5c1fbf6042fd2b0915fc301f557a5477373bb1e2d27d751a29a1c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.129/aethyme-v0.8.129-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea97f572a99e9dd43390423981848a4b264a5cd7201234d735f0d56b28a84f92"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.129/aethyme-v0.8.129-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ef98b586019f63b9f993ca199d5f9f69e6d50d5021a6fce12dec016f605a85b"
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
