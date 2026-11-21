# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.145/aethyme-v0.8.145-aarch64-apple-darwin.tar.gz"
      sha256 "35976da2067e59d8e8f0bdccb67bf6dafc7d8603e067b2fe39671ee130c01e0b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.145/aethyme-v0.8.145-x86_64-apple-darwin.tar.gz"
      sha256 "4bc5ee70b63bb2fbdad28654549a3933e1d79872c0fa9c4682c0d996d03aea00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.145/aethyme-v0.8.145-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76538a7f8734eb7035c8b3462f5ac69dd7a13236fd854003e55a2eba6e25e783"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.145/aethyme-v0.8.145-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1323719d21ce7136ced50cf63b433146854d0b75794370e4aa05c5347164553"
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
