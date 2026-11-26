# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.184/aethyme-v0.8.184-aarch64-apple-darwin.tar.gz"
      sha256 "76f72c951fbcba466058b23deed11402615beab35a781525226bd36a5abc23c4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.184/aethyme-v0.8.184-x86_64-apple-darwin.tar.gz"
      sha256 "07ba34d3c0075dab59fc0e8ae5e871fbb6ff2aaa2299f1c48d7aa3f191d79982"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.184/aethyme-v0.8.184-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f24351a9f787254cd69ec0af9c661160d9ff2251cdb728f74dfe5561a1f9fa46"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.184/aethyme-v0.8.184-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48e369c4c78748b70487299f22e9bc2f18ee691466218e568b9fd0a336e09e66"
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
