# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.166/aethyme-v0.8.166-aarch64-apple-darwin.tar.gz"
      sha256 "cd39208a10d5a39d3fba045538a7c12e6090f44af3c2a0966ae60e65433b7de5"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.166/aethyme-v0.8.166-x86_64-apple-darwin.tar.gz"
      sha256 "81e0e5bb275deb600c2f13c1391e48070d361b634ce5e5cce06b4ccc5f736da6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.166/aethyme-v0.8.166-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73478bf2bc874f99441fe53af5f1b97c47048583b632d20fa612491cd0d922be"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.166/aethyme-v0.8.166-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "697cf643a560ec5fdff916f919a07b571337e312628eb86e44fa93250f64ec7c"
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
