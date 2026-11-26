# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.181/aethyme-v0.8.181-aarch64-apple-darwin.tar.gz"
      sha256 "a678d9c7c5f9158398a41a60e75899674c1461051b80deff5f8885ae0cdb72c0"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.181/aethyme-v0.8.181-x86_64-apple-darwin.tar.gz"
      sha256 "a711a4c7ac9cb9fb5fed93e14ffa7dcc633ccb73ab651b7a8b1db9a68597dcd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.181/aethyme-v0.8.181-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3280b8fa11aa5b658bddfeef313ffb528291cc41e8aab6249b3eab93af808adf"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.181/aethyme-v0.8.181-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1fc0098090f361a3bd5365249bb6af3b584f285ad4c9bc7a1b021a8284799d9c"
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
