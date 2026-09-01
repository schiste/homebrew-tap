# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.0/aethyme-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "1a0f2d38d1ddb841f26d73a202e0afa4312e75726afb5964a8f5003f42c73b1d"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.0/aethyme-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "cc697024c6e8cc3596db9ec6db8c2086968bac88f72d3de59a3e65cfb15e6410"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.0/aethyme-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18a80a25b862db807238f1de516dbd4ad3eb543251f9763a735a89f5305e4678"
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
