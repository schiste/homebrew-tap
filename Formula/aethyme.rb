# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.170/aethyme-v0.8.170-aarch64-apple-darwin.tar.gz"
      sha256 "1f7bfa4a2b0ca48f2fa37752ffc1c5e3924910b44980687207b4a11f9b77f10e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.170/aethyme-v0.8.170-x86_64-apple-darwin.tar.gz"
      sha256 "dfc34be629d9f09e4fbe8e38afe3f6250da67d22f542ce9daa550ee46b257809"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.170/aethyme-v0.8.170-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "850a455bd19b0e30382fd4f9fdf7e24726b93a50c270fdd2c1fb72d8fc76508a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.170/aethyme-v0.8.170-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd305210fbaa5de45451b5a7b1eb27fd38ed59c6e82801eeb59ba736bdad94e9"
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
