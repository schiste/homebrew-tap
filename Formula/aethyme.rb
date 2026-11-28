# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.189/aethyme-v0.8.189-aarch64-apple-darwin.tar.gz"
      sha256 "49b63e5bb4a62e7af1e2f68b0e5469a77806c5a79135998d2a304030bbc576c8"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.189/aethyme-v0.8.189-x86_64-apple-darwin.tar.gz"
      sha256 "891ad0b3dc0054c41c5cee0af94df9b2bd4ac4a79e33e3562db57798ead53932"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.189/aethyme-v0.8.189-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae4301b232e65b2bd1a76b98eddb28e390e70fcea5ebcd8396984acb6d8fa60c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.189/aethyme-v0.8.189-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25d24fdf7da781b339720cbaad5841aca3bcd653989c4d5a66a219c8049f461d"
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
