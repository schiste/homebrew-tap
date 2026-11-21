# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.151/aethyme-v0.8.151-aarch64-apple-darwin.tar.gz"
      sha256 "496a7ff5a4776c9ab7f428e4f7aecb5ba05e7bd7afca08554711a8cf46cf5f37"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.151/aethyme-v0.8.151-x86_64-apple-darwin.tar.gz"
      sha256 "008b3edcc59d80c249720c1f285dfb6e79a5435a09ee5d4930e896bc728d6f31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.151/aethyme-v0.8.151-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0584961bce3c98baf907ce89eb0a31504d693a73cdac9022cb3114b2f40f0d5"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.151/aethyme-v0.8.151-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "366ab953a5ab94b596c7aee5f46ffc5f50fd76d2e061e8f1f070d25a450f473b"
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
