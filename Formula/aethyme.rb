# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.39/aethyme-v0.8.39-aarch64-apple-darwin.tar.gz"
      sha256 "bcc5d060bd813ffc06d56574f68c0e9a97ef98e9d18e3cd8feaa874bbef56a14"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.39/aethyme-v0.8.39-x86_64-apple-darwin.tar.gz"
      sha256 "488ed44009ddde9839fc5053f64b81026f04242a9562f678f5eb7c2250db9bcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.39/aethyme-v0.8.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "698e3203ba488b7b89a11e523c3f53ecd6736227fdd84e1d54e708235a79c972"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.39/aethyme-v0.8.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51b696f12e18f73111625f80e786226d7d51d3db7cc1df09a5e9ac2b98781a5f"
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
