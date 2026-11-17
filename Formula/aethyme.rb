# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.117/aethyme-v0.8.117-aarch64-apple-darwin.tar.gz"
      sha256 "c8e03d70bbcf495ded8728ca5ad162996763d83a70a34e43c8996470c869d9f2"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.117/aethyme-v0.8.117-x86_64-apple-darwin.tar.gz"
      sha256 "822aa56fecbaddc46178ff105e57f723cdfaa096d7e060e59cbe21ef1e2674cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.117/aethyme-v0.8.117-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0235037e44dafbdd9bdb9cd94d8eac6155fc8b721eea9fc16387586af466c46c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.117/aethyme-v0.8.117-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2bbc729c28c372ccd80330f621985a5b5b1bc68bbe509653267b088e2988c13c"
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
