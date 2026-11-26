# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.180/aethyme-v0.8.180-aarch64-apple-darwin.tar.gz"
      sha256 "cc5f0544e62ece4ad4d8f70911bba30558ab3a3b955a44847c7af99553f9076c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.180/aethyme-v0.8.180-x86_64-apple-darwin.tar.gz"
      sha256 "140c4556a47d1c8db0f1dfcbd4662a87ae38795af777a4117acf9cfe0aba7796"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.180/aethyme-v0.8.180-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10824617548c7bd80553f70e4dcba09dab7bdc5a54febac21990edcecd7f579b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.180/aethyme-v0.8.180-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30f9aa5aadda5d10f697154c8490a5127b5681b7b6f83f28e642694e0146c2e3"
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
