# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.21/aethyme-v0.8.21-aarch64-apple-darwin.tar.gz"
      sha256 "0b469b5f470f2ce0daa88a58cb0c630cf85cc1a8f4142380c363c1f1a30bea2c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.21/aethyme-v0.8.21-x86_64-apple-darwin.tar.gz"
      sha256 "207cfcf7cb740452eaf1b20b7a78f03b3c5098cfdcad8e53f3b9ea6d8cf5309b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.21/aethyme-v0.8.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b77d023dfb7e444b56a621a8a97486acdb963db0e45f0e8c39b8c1627b6a612b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.21/aethyme-v0.8.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea53ecf3e0a1297e810550637b27698d05d3b9e4ca06f1ccc8ac0fb41486c538"
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
