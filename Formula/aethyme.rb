# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.85/aethyme-v0.8.85-aarch64-apple-darwin.tar.gz"
      sha256 "ba36389a4ee61a83d7ca56016596b99ef72c447247462f0592fb19a50ae9e193"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.85/aethyme-v0.8.85-x86_64-apple-darwin.tar.gz"
      sha256 "25702bb7be2d24ad5fc7151236db0ecc24ad89567f25226d89aceb872a928897"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.85/aethyme-v0.8.85-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "36f0c40d5f333a503bf0dca64443de1aa055bd1f839060205043016b02be8a98"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.85/aethyme-v0.8.85-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c44a684e1381f30d278ec7c52fa667d60b4ea754d028169ecce5561d29dde28"
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
