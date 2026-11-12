# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.73/aethyme-v0.8.73-aarch64-apple-darwin.tar.gz"
      sha256 "a78df7ec0f70476f35652cbd77caec805ad6fba5da0afd1cc09b046922cb9b2d"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.73/aethyme-v0.8.73-x86_64-apple-darwin.tar.gz"
      sha256 "59e1507582480c07fc7b450a61e79ad9cbec872e99c91762c3eda258da4589d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.73/aethyme-v0.8.73-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "09c03f9d5fe506d8e8b698bafae9a033cb3e4b814f5f831ffc54efc0435510df"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.73/aethyme-v0.8.73-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "50c05b34c1e8e815d822add7485c7312e86d2e6fa1f806f016cdd901a902c546"
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
