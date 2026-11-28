# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.191/aethyme-v0.8.191-aarch64-apple-darwin.tar.gz"
      sha256 "5cade8ccfd0854f2e6a98d5db79e7c9fed71c7a3aa69a7e95d91b62e0a79e9cd"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.191/aethyme-v0.8.191-x86_64-apple-darwin.tar.gz"
      sha256 "c26884a6dd68a5e2de64398c47f6a0943e23c9482b36b2eb6719408edf4582c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.191/aethyme-v0.8.191-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8c4773ba94dec1f1c024e27d01de6aec6576573bc8a6a12d813aac0d07d0b93"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.191/aethyme-v0.8.191-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec01dcec0119d9be1780afb5e2c4e0c98fcccf7ba77e136c3bffe726499cc5fb"
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
