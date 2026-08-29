# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.4.1/aethyme-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "5313a9b0356c4cc9d95e88034c61e4419f5e2ec56432b0116ec869ccf5ca5d3f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.4.1/aethyme-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "47397cbc164d9e1ee0595fb28bc87a13b05632e0ca0c28708b7faecd3c6cf806"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.4.1/aethyme-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5a27423cf33762063c2e0e204fa7dd03c255416db3b1da05bcf756295850953"
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
