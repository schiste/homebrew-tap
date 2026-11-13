# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.92/aethyme-v0.8.92-aarch64-apple-darwin.tar.gz"
      sha256 "55cebf2d1be0f5537e9b14314eda95e486af3cff317f9991f218d3be38e2f46e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.92/aethyme-v0.8.92-x86_64-apple-darwin.tar.gz"
      sha256 "d2e0409cdaadaebdba9c08777f2fca7d777afde2ca0d514d6fa3708239c3de19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.92/aethyme-v0.8.92-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1cba4a5598ae613e54ed1d9934061bd2217f303319059181bd2c6c7c79e8281"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.92/aethyme-v0.8.92-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "557f5721bba54d9967aa7bce07ad5bebe9a90ff1d569a6d7c6c8fdea7bbc9528"
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
