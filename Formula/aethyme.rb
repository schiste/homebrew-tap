# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.4/aethyme-v0.7.4-aarch64-apple-darwin.tar.gz"
      sha256 "fd571b426c9b1db94bcb6290f90e403a3e22fe4702a0e02a51d2d6000b9e6a63"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.4/aethyme-v0.7.4-x86_64-apple-darwin.tar.gz"
      sha256 "b79bf8d539299fe6354a9bc73a4866b6276411dcf1ad915679fafc8311200ebc"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.4/aethyme-v0.7.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ef99102506ac81af435b9125ef7712d28ef5c25eab27fda1c7c370396bfb697"
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
