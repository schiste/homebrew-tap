# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.49/aethyme-v0.8.49-aarch64-apple-darwin.tar.gz"
      sha256 "cd9c739007e9e7f9d1237a2bec6abacd31ec76fd37537aa5bbb03b2abf4c4aa6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.49/aethyme-v0.8.49-x86_64-apple-darwin.tar.gz"
      sha256 "9fc4b9fff147aedc9cde8acf92d571bfc68f314e81eebb09ccfb87f8d9830418"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.49/aethyme-v0.8.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "191baf8f19ebcdd3e10fe4bd78fbe5d4f15607dbc5855664debdd478838e7032"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.49/aethyme-v0.8.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c7bdb067091c5bbb18209dea4c0c30d5b510642fdbd740e7cdbf4e00f4fe67a"
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
