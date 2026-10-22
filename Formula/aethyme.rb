# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.30/aethyme-v0.8.30-aarch64-apple-darwin.tar.gz"
      sha256 "eb80da485a587e9079795df1c923639a7e27365d6762dd3b3af090f7f14319d7"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.30/aethyme-v0.8.30-x86_64-apple-darwin.tar.gz"
      sha256 "f6760a8bcd7449f7ba6aa92269abf52bdce687e72d58bf3ce2246b4657a5cf03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.30/aethyme-v0.8.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6061b10bc8ebb85c8871760ad9c555026eb238a3288ae2b2ad518b35a9aff0a4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.30/aethyme-v0.8.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff4f6196cf69bd11665aef512b705a1ba8e5c5cae778e74c9a2e643d21dc29cd"
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
