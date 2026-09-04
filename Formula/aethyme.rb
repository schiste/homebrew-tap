# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.6/aethyme-v0.7.6-aarch64-apple-darwin.tar.gz"
      sha256 "9831b409722838d1f7adfde85f03c1a8d6b30910b5518e320e538450301b0003"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.6/aethyme-v0.7.6-x86_64-apple-darwin.tar.gz"
      sha256 "eeb04342f2d97033ec35c035f3a5e4e590dc77542ed8375ce9756d3555b2348e"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.6/aethyme-v0.7.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e3cfb46bd09087cdb86f47a282220043e3c67182e187edeee650305d44c67a68"
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
