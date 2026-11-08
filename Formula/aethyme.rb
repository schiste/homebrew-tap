# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.63/aethyme-v0.8.63-aarch64-apple-darwin.tar.gz"
      sha256 "6b5a413acac739d871bf2df17a890cca0c86b3f843b3ca691908432a6b9cee3c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.63/aethyme-v0.8.63-x86_64-apple-darwin.tar.gz"
      sha256 "f02a822c9353295252ba0138c03fd35d31bc590eb9e7ea6aaa566298780bc544"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.63/aethyme-v0.8.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c4c4eeab98b5f72e6eb5b4a62f19dd2816c5c21f176dbbdfcc0b4b149bdf920"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.63/aethyme-v0.8.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fd8d52c52a3fc712c95c28008b656c0f3893070c1f29a84c745e76de2ad8dff"
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
