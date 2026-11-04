# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.57/aethyme-v0.8.57-aarch64-apple-darwin.tar.gz"
      sha256 "c73497f3940f65e7dbf06a5760997aa6f4de177afe9495ed84758e7c03a69554"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.57/aethyme-v0.8.57-x86_64-apple-darwin.tar.gz"
      sha256 "6e03ab03a86cf1049752b5c234e731dad680093b64a4b1a471a86d5abd14b91c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.57/aethyme-v0.8.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "053938ccaf043d4ad04163a0f4bd05ffeb0e0b78c7f6889c917efe8866813ec0"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.57/aethyme-v0.8.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5da0bc6c6fb925f1c7d8bea622d0750412f9086820ea45970ef485e0827a6ce1"
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
