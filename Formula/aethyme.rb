# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.66/aethyme-v0.8.66-aarch64-apple-darwin.tar.gz"
      sha256 "785bafdffd464816dba9e161214fcff7e666a014ee9fd9c34b2659b124290b60"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.66/aethyme-v0.8.66-x86_64-apple-darwin.tar.gz"
      sha256 "7b89f31d91c13640448627e7ac62656cc8d05bd4394071c8fd6167e1d11a09bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.66/aethyme-v0.8.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad525ba2d3ea5e77072a1a57bca5d92989c5fc327b54ca12642bd051a7fd7fb1"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.66/aethyme-v0.8.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "088c6e3e7a4de31092262412fcabaaa97205c8a0588d5097698faa0d85e43e05"
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
