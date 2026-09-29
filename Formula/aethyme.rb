# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.8/aethyme-v0.8.8-aarch64-apple-darwin.tar.gz"
      sha256 "1f7fbdaae7de9c2257d45ba2ca6f2700cdd40726e020edc1cad4447e851257db"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.8/aethyme-v0.8.8-x86_64-apple-darwin.tar.gz"
      sha256 "0a0a5e7d5fdfed49b84d0eb82138208f6df00830e9811cfd6762a513ec658489"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.8/aethyme-v0.8.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "840d073a7c9612015ff52e83a2020ff61823e8554f74bb5400122cf234f278ca"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.8/aethyme-v0.8.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b40b35bc118904be7f562bff0ba022069d8271b601d5498e06189f9a752f556"
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
