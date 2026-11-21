# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.147/aethyme-v0.8.147-aarch64-apple-darwin.tar.gz"
      sha256 "b1c9b640ced04322c5ee2b42b9a4fa30a5135240e0181afaec14f9d7a1abd7d7"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.147/aethyme-v0.8.147-x86_64-apple-darwin.tar.gz"
      sha256 "e2083af881b42b9a20688e80c624f829e0d181c584d2f73b5fe989fe0be6132a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.147/aethyme-v0.8.147-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d345d087d9bc9eedd4ee3ca2fbcef716c97b3fe127de58c2291eeb9f7e4a5678"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.147/aethyme-v0.8.147-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18559c2c509456e7ab28580757251f9842df2cf2f0174dcc9ea6a2da21b5f334"
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
