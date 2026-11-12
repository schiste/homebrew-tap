# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.74/aethyme-v0.8.74-aarch64-apple-darwin.tar.gz"
      sha256 "ef37e399813aae938ca1fb020d244db0c8a69040d075cc402086e690662054a4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.74/aethyme-v0.8.74-x86_64-apple-darwin.tar.gz"
      sha256 "da456d291539f5d22a2ed8b464783d54a41ca23157e2f2568ae521bd9b5e72ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.74/aethyme-v0.8.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a03eabbe7be096311725adcb42c3ac9c3a4a14d00ac3653a0f2365abbfa516b0"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.74/aethyme-v0.8.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "679f622507e1f90b4cc01769268e946d0891cccc55ce5da41212f3ba695b0d97"
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
