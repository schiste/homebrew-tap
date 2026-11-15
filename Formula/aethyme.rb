# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.105/aethyme-v0.8.105-aarch64-apple-darwin.tar.gz"
      sha256 "a1f4f4440d78a5d3f81217f97a840d90a82cc557c1b16972b5023d64d1d0b3e4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.105/aethyme-v0.8.105-x86_64-apple-darwin.tar.gz"
      sha256 "5bd1ffbabbcff98449e540192340f2b293889a27412142c963b1d160fbc39f15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.105/aethyme-v0.8.105-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49433655ab989111c05e3c0619d1d30e8627ac2ce023f544a22514723114c713"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.105/aethyme-v0.8.105-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ace6b46a880a41cf53b77b7fa936afa2241cc51e17868e26c03dac40ea989f3"
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
