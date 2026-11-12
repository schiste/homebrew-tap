# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.79/aethyme-v0.8.79-aarch64-apple-darwin.tar.gz"
      sha256 "dc82f5cc4ad5c36b90cb28cf3f06274e79a4e55b1bdf912704013ee808de65e9"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.79/aethyme-v0.8.79-x86_64-apple-darwin.tar.gz"
      sha256 "5308dd7514c6579053d101218fe63f5eb65fc201bad5b03b89835367b177fd04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.79/aethyme-v0.8.79-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1dddd4fb327bba93774ea0d66a43f9823bb21b5d73cd9b0a6eeb6a8b15a27409"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.79/aethyme-v0.8.79-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2786945bfe98e55ba608c7ed8265b37f31ce6f0fcf6c3067e4ced0bea0844b39"
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
