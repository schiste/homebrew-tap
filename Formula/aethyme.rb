# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.168/aethyme-v0.8.168-aarch64-apple-darwin.tar.gz"
      sha256 "a4d44667c9ecb1fdd4b8ac1536cc72eabfcfbe2e1f088ebc50aa6526d618c27b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.168/aethyme-v0.8.168-x86_64-apple-darwin.tar.gz"
      sha256 "3d5a3d2c216eff5b3213e84b56e3daa53314c8d96fc1faacea1e008e27250653"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.168/aethyme-v0.8.168-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59ad9591a2f83fa39fb857f7603afc28eff7afa7de22cdb1e0264d7351bec2d3"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.168/aethyme-v0.8.168-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e751c73257d0dd760d4d9b1a6cf48efeda4028081076d3754e825a98d680dfdc"
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
