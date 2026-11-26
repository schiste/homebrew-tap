# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.182/aethyme-v0.8.182-aarch64-apple-darwin.tar.gz"
      sha256 "4796bfa8bb8ef7253ea002fd89f85b88a7688e9067c5000b12969da116e2f999"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.182/aethyme-v0.8.182-x86_64-apple-darwin.tar.gz"
      sha256 "bb434e273684a48781fdcb8c1c65099182de62df6a49b83b6c337919f095648c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.182/aethyme-v0.8.182-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a83674c1809050d550e90e49b29985f2d3e6dbba704caf6d8816c64be764b692"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.182/aethyme-v0.8.182-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f6cb966c4b40993f1d87e96c12e98bfbb26d22486f3cc1585a28f362931cc3a"
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
