# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.137/aethyme-v0.8.137-aarch64-apple-darwin.tar.gz"
      sha256 "f0f2b6afc997a026fd3ebd702d32f712ad43e8c5331bb102af5cc4a6bbcfba28"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.137/aethyme-v0.8.137-x86_64-apple-darwin.tar.gz"
      sha256 "b644621f76175f27c4c0c8f8013baaec71e8efe9994f66850f5990f1f263d5ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.137/aethyme-v0.8.137-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23ad4bdb90e5ae6a59b7bdeae51f391d0255b7df97bbddab2063a16852ad03dd"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.137/aethyme-v0.8.137-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5aafe4486a98561c06fbc76eea212f9ea4c6c7dac95f861ce6866023a5063278"
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
