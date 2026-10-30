# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.51/aethyme-v0.8.51-aarch64-apple-darwin.tar.gz"
      sha256 "7d250e540fc1c3b444f78373da3fbfccca34d92774eef17ba2d6f5ace149138b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.51/aethyme-v0.8.51-x86_64-apple-darwin.tar.gz"
      sha256 "8c9e6cad3ec34073efefb38ea3f0819dfe9259aaa18fe84afaa94108b45ee1e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.51/aethyme-v0.8.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6672583e9d492ae85d5ff582e9ac96a240956297d1503ca4db781128051b1773"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.51/aethyme-v0.8.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69d7c656e7e6a3619a8492b9e2446515e5b2a4217a91f641114e1bd384c96a03"
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
