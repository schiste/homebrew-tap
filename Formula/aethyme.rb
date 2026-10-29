# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.48/aethyme-v0.8.48-aarch64-apple-darwin.tar.gz"
      sha256 "12f20a26a26741c2f29422edcd8635397e66715f488653f03c73de64d9d79748"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.48/aethyme-v0.8.48-x86_64-apple-darwin.tar.gz"
      sha256 "0675631b142e8369ddc6dd62601745bff2187b22ee9bc1fcd8f4fad5846482b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.48/aethyme-v0.8.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0933fe584943e068d03325e363c2bc1deea1691dcd5efbc660a7080b273f9a58"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.48/aethyme-v0.8.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e427a54ac98f5c6ecc6504cd82f2c0ab61c2d89a71ebf9927cf86eecaff7dad1"
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
