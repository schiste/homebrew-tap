# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.8/aethyme-v0.7.8-aarch64-apple-darwin.tar.gz"
      sha256 "bee75d82351fed2163639cc9f138e4ebfcf745cf65d6c9fcdfc8d458cd5b1350"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.8/aethyme-v0.7.8-x86_64-apple-darwin.tar.gz"
      sha256 "528fab5a9cd751ce971fa97360e4d935a3890001198b43522b02e05a7c6abcbb"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.8/aethyme-v0.7.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "672f623e98495ed2ebdad75ec8ee0f535251e8ff4a62fcd8959d3dbac210f0de"
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
