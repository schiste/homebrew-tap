# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.144/aethyme-v0.8.144-aarch64-apple-darwin.tar.gz"
      sha256 "25ff27033a5c477461d1b47ede1df35f09d9367dbb45414125fbba84ea14888a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.144/aethyme-v0.8.144-x86_64-apple-darwin.tar.gz"
      sha256 "3effc98cd193b767b0b2438b4c029f996a5ed07014cff21e927e6e0e31274a38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.144/aethyme-v0.8.144-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e12e8f673003685e7bcc5289e6c3f2650a793a0ae3cfe0f24cbef232186f9a7"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.144/aethyme-v0.8.144-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dfc709c989d0f2cf600df2617abafb2a1efbf9e8aed3b08c43f323681e275615"
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
