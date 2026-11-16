# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.113/aethyme-v0.8.113-aarch64-apple-darwin.tar.gz"
      sha256 "17f34e4f1de7c2ab59c790da4bdcb22104a4a4355d4a1523ad09a8fec1b88477"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.113/aethyme-v0.8.113-x86_64-apple-darwin.tar.gz"
      sha256 "1bc4815a9e894259069dffaa915cf32ea39125ec85051c4595d189189a13f2fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.113/aethyme-v0.8.113-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "934a2f859b065a00aec677978c9ae26ee4dd61dab16fce054ef9a6bf6f4caaa4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.113/aethyme-v0.8.113-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66cb4c8bb2ff5c647257d5a176e21e0aabbd4ec4fc73963e26746b3aab899e87"
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
