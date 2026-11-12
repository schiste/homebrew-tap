# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.81/aethyme-v0.8.81-aarch64-apple-darwin.tar.gz"
      sha256 "1b9f0c5142d2ca26b80c6cfe4c1215f0cadc83ce5b7a5992ffe11c8eb78fbcb1"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.81/aethyme-v0.8.81-x86_64-apple-darwin.tar.gz"
      sha256 "e9ecf5276820a2a5c72b67264a44dc3d8015dc5ef7b1901c891612d074fe7c6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.81/aethyme-v0.8.81-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "46fb65e5a2b0214e47f6122528ac87096785dd186dc40f2761bbd47deb40e056"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.81/aethyme-v0.8.81-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa5a4c0370e086d3450a24a416cd887b0344f232699f71c665bc41bb5dd6aab2"
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
