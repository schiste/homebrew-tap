# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.47/aethyme-v0.8.47-aarch64-apple-darwin.tar.gz"
      sha256 "4ea97affdd6391fbdab6f2f7dce1f01c20366917998fe4dd82a7ff94a8932544"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.47/aethyme-v0.8.47-x86_64-apple-darwin.tar.gz"
      sha256 "932f70cdc5a6a2a9593120149eb74e3516e8895e2dab25f8be9ba029c4387fe1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.47/aethyme-v0.8.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f675c1298f2d3dec37757cf7873d45a5ec6e1105b8f5cae658ebef3e93e40e1e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.47/aethyme-v0.8.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8a5818e34849164c3ffb21ad6d804e4cf219867d431b94f9e7ec3d6cbeeff7d"
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
