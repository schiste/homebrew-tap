# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.43/aethyme-v0.8.43-aarch64-apple-darwin.tar.gz"
      sha256 "811aca4df94a26ce41abc3446aa9bdde33fec761c96d69afb3b2750e6feb0b1e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.43/aethyme-v0.8.43-x86_64-apple-darwin.tar.gz"
      sha256 "e2de876d5039bff9d5aa650cb7ba7fdfb31fac1d20bc69e180781f4841c475c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.43/aethyme-v0.8.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50a5fed9152ad08bb80ae848265058521640a8778ecd3b885d6cc35d7357deac"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.43/aethyme-v0.8.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06c14bff9c0ec60e71e7fae3ca8d406954d382cf9df335649ea171c6dea6b5af"
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
