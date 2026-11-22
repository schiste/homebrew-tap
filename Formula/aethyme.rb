# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.158/aethyme-v0.8.158-aarch64-apple-darwin.tar.gz"
      sha256 "92d951bee2ee0439c4f84d2a74f4d26feabe5b7a0d3eacd4c0b6ca62792be1e1"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.158/aethyme-v0.8.158-x86_64-apple-darwin.tar.gz"
      sha256 "a7292ef5ca566b1cfaecde5c8bcd2eda1e0d6b1a0dd8dae1435b43e2acfaa847"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.158/aethyme-v0.8.158-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f44a3c7e108301239e6f9cde7ef6104342e4fd6390060d41420bd49246711ef1"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.158/aethyme-v0.8.158-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef35e848e199c7fa4ff0828f53098b5532462e07de1bc59a209bab043e36acd3"
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
