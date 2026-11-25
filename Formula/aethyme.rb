# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.171/aethyme-v0.8.171-aarch64-apple-darwin.tar.gz"
      sha256 "2dc3c87a310873ca246efc6bdfe20d6c7c3a559f971a1d35293abb7a4ddd72db"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.171/aethyme-v0.8.171-x86_64-apple-darwin.tar.gz"
      sha256 "a62a868979f400ddc032a5ab3cd016f5b7e9434e05a6bce6bba0541c7820e99a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.171/aethyme-v0.8.171-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "382a35bebd8e59a86bcb2939f4c4e14c7f4beaeb27f0f24db87b1a7d8fe41347"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.171/aethyme-v0.8.171-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e2d37bc02ac3d5ca47dc25de6b2763b133e6d5a9a54c918cce36fd9504c30135"
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
