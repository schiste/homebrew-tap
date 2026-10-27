# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.36/aethyme-v0.8.36-aarch64-apple-darwin.tar.gz"
      sha256 "19f05594fa9b433a11ba0f620b129b1c801d35869bf34dc300144775eb086488"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.36/aethyme-v0.8.36-x86_64-apple-darwin.tar.gz"
      sha256 "98c538645a8e5a8347f935fbf95f85f69cb4cc9f0b28602245e0154ddd8b66c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.36/aethyme-v0.8.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d306d5d20ea5c3cb58703d09eea41c61e65a46df9944fa91d3ee2a125cdcac69"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.36/aethyme-v0.8.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "951521b66babc050315b5c007bb9e0a1e34eb5f3df15fd80ff302e2751c86080"
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
