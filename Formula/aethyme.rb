# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.2.2/aethyme-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "c1735e00c2cf2751ed399b8f682594bb80f78d1568abaaf4d82f463441d01d16"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.2.2/aethyme-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "4bce0124482b1a9e4af98dfc2de4aa6c05a93cfd130809579e3bbc9e5afda125"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.2.2/aethyme-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04e2859b06c82592ec0ca7ce04a4e2de01ee7c86fbec5e658c7349d7ebb81bba"
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
