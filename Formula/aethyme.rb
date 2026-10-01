# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.14/aethyme-v0.8.14-aarch64-apple-darwin.tar.gz"
      sha256 "3489cc23dce740fbd68c74c97f7527847674c44b39daf85a45b8786796bc2ff2"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.14/aethyme-v0.8.14-x86_64-apple-darwin.tar.gz"
      sha256 "5e47069592cfa154281b3147697fce18eaee70fd6b810bb73535a485341d7786"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.14/aethyme-v0.8.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "031d87c4f74e64343f3c449cda1c4b848aa4d900ff44afa1f1f0ecc74c657289"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.14/aethyme-v0.8.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9acf38fd1b071f2b13f37d7a7a8b17e2a7ccb834f8035113a5e52f2694de9b80"
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
