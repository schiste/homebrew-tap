# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.192/aethyme-v0.8.192-aarch64-apple-darwin.tar.gz"
      sha256 "a6338bff592d969ac777c605200a0a8a355d8fff99508c7a54ae1af86b002aea"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.192/aethyme-v0.8.192-x86_64-apple-darwin.tar.gz"
      sha256 "e6f26c82586d154fa9d52a4ef714465a3dcfaf580ee75cdb397e379ee518c302"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.192/aethyme-v0.8.192-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94ed35b2631642b48318fbfaf680edf8d24ad0f2ae03171b0d44fa14bf544f44"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.192/aethyme-v0.8.192-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "adbc8381f5d253d17030f7ae61822393345eb36948eb3547fd19018294c53980"
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
