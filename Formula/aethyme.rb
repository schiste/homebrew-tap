# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.28/aethyme-v0.8.28-aarch64-apple-darwin.tar.gz"
      sha256 "3fb4c9a794deba8b15c4a9da8fe1cef5e257b4d3d2e00c6a15deb25efbf6e796"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.28/aethyme-v0.8.28-x86_64-apple-darwin.tar.gz"
      sha256 "d8d64ebf9bbb6369e05178d31a3f0f144d438b1172e0ad425f1cc9689419cc14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.28/aethyme-v0.8.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffa94ac1d5b479a496b93ff17a3345a2a4566915f9913aa64621b3970aeb353b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.28/aethyme-v0.8.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9dfa6b80bc22b6fa52542ca42e1059fb77bbb50a807315a0215ec9c96b45ff8"
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
