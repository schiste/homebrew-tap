# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.177/aethyme-v0.8.177-aarch64-apple-darwin.tar.gz"
      sha256 "6f9bbf7ecb4a5dbadb7a395f7727bb76f91ede49aaa4332baf03d485e395ffba"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.177/aethyme-v0.8.177-x86_64-apple-darwin.tar.gz"
      sha256 "6818734b8570a1ef4900320c7a13255f27fb26c8487429cb4b57cd9e09d3cb79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.177/aethyme-v0.8.177-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c3f2f2ecda5ed35e9c0eee16b0045496747cf7c2cd770e1a59ac566507a2662e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.177/aethyme-v0.8.177-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c07c7ad8ad323545d5a9bb1f0f33bf0951bd365e396e47645d917e6435a0bc3"
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
