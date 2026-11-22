# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.155/aethyme-v0.8.155-aarch64-apple-darwin.tar.gz"
      sha256 "4f9cddf20ee3347d2aacee94bb2c8a810bc0bcf7081a502cabb47b34932dbea7"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.155/aethyme-v0.8.155-x86_64-apple-darwin.tar.gz"
      sha256 "d41ab17a7401c62084a0d00112578e96be0fdfc68b6d9f7170bbd4923f44fa01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.155/aethyme-v0.8.155-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d862b925599543a7749dd3b6253b6f306a5fa6a1b38349425c462ce3f4bf8dbc"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.155/aethyme-v0.8.155-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a71bcd69b67fa1ea52ebbb77652024ad8057bb5a074406545a08f7ad83b07ba4"
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
