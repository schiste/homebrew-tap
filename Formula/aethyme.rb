# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.12/aethyme-v0.7.12-aarch64-apple-darwin.tar.gz"
      sha256 "1b8846fd213fb6f66bbd28da2d56cbf6b4861cdc85c6741ddc77f80331c377b3"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.12/aethyme-v0.7.12-x86_64-apple-darwin.tar.gz"
      sha256 "c160e914f52276d65d788df3851d7cb099760b65f1fec98ac00715a8bac4cc4c"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.12/aethyme-v0.7.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9235d577a66523a01e516a74cac9ac6e9b12e13a45841651855eab1aa1bf7bf4"
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
