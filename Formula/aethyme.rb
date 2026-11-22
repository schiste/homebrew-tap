# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.157/aethyme-v0.8.157-aarch64-apple-darwin.tar.gz"
      sha256 "5837fb2dc138c77f2e0cf9d20678dcbb524456367d7018c52947d98d4686126c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.157/aethyme-v0.8.157-x86_64-apple-darwin.tar.gz"
      sha256 "744d85213b4b708bf036126ef0e645ceccd66fd45c59d57e81054a51ea2924ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.157/aethyme-v0.8.157-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93ceb3220977ce765acb22b3e0fbb10cc3126018af99231fec9d98d57064081e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.157/aethyme-v0.8.157-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9527aeffa08415418ae00c2715462e7d0c92fc76e078e4b98b564846ea312ce4"
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
