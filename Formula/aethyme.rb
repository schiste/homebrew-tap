# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.154/aethyme-v0.8.154-aarch64-apple-darwin.tar.gz"
      sha256 "91f73eacd009ce120d457944cdbb19480e6a31756c2e39af4c6ed0277023d0d2"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.154/aethyme-v0.8.154-x86_64-apple-darwin.tar.gz"
      sha256 "9687dca31fef873d328c1c5b99a16c2d4ebff71e95054de15a143f211c4dbe2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.154/aethyme-v0.8.154-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b18bae87db42e70e24a05678b95ef75aec82d07fe9aebbd5cccdf18f0854cb74"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.154/aethyme-v0.8.154-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "043e52b49674cfa72fcfaf422876ceb745111474b4d3eea1054e9201c858aa8a"
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
