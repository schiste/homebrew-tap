# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.10/aethyme-v0.7.10-aarch64-apple-darwin.tar.gz"
      sha256 "8f74b4ea6c6844bb0c8ce63a2c20dd0d218ff92bb53f56fd9c04c662ca74e63e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.10/aethyme-v0.7.10-x86_64-apple-darwin.tar.gz"
      sha256 "8f00a7fede4fc4f7959b098a9f2f8476a71b506aeeeef1d519fe82b2050a6aff"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.10/aethyme-v0.7.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e152ea03a03e2764491e3762c93cbf6ffc08dc67b1af27a14c3a6092f2342a27"
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
