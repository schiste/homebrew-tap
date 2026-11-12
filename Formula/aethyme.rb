# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.77/aethyme-v0.8.77-aarch64-apple-darwin.tar.gz"
      sha256 "2722a608951e674c9e501c0acf99f835aeb25c16a67b4b8dcd9697115a6c3d31"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.77/aethyme-v0.8.77-x86_64-apple-darwin.tar.gz"
      sha256 "77553719c441e08ca5c8b4b544c1c7bfd1c4af068ca66a9551cd6dc5a4424aa2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.77/aethyme-v0.8.77-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d2bf2a06a16e944f6144159f0085261c3983c3962912a6f966ca50e9695d381"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.77/aethyme-v0.8.77-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4eb5b7ba1e22549bd5169dd525a0dd3bb6cee249787adb09350cd7be24c4835"
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
