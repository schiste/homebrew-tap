# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.26/aethyme-v0.8.26-aarch64-apple-darwin.tar.gz"
      sha256 "7e44c9e893f2b2a3b10d582291a6302d96379a45e8c90ded8961156f8584797e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.26/aethyme-v0.8.26-x86_64-apple-darwin.tar.gz"
      sha256 "24485b858afa7e5116ffd7bfbedd933cc273c8e0f79c272bbaf57672eaa60f63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.26/aethyme-v0.8.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4c1d5b2fcf993e3baf4f5bcebef2d3d25adac96b799fa6d192910a53c3657b7"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.26/aethyme-v0.8.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e81c760fdedbfdae5f74af7a0fd15fb9ce37807de5807da6a84ede44548f4026"
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
