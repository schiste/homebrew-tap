# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.53/aethyme-v0.8.53-aarch64-apple-darwin.tar.gz"
      sha256 "70cd8daeaf371e48e2f860bb220e62547e8dbb3c6a5a4c5a8c1e541dc73aa5ae"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.53/aethyme-v0.8.53-x86_64-apple-darwin.tar.gz"
      sha256 "e4f352ffb2596002bc843a5b94a4c5bb6dea9accb154d2a2baa132dd2cbad034"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.53/aethyme-v0.8.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26819cabf9f13dc47edc2b484c649b9815bee8ec768b58eaf53915a1971e47f8"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.53/aethyme-v0.8.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e76b57c443a081e9a197eea69b071a6c2bd4440264d1197927aedc27661beb1"
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
