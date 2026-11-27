# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.187/aethyme-v0.8.187-aarch64-apple-darwin.tar.gz"
      sha256 "a92589142fe3d48e8ad1a30cc6dbe8c1a2b6edc00a40cc3a8434fbcb06ce92ee"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.187/aethyme-v0.8.187-x86_64-apple-darwin.tar.gz"
      sha256 "8f12c5b85315f8fd6530e33309afae186dcc266521b8f4c2bd6e23bd95d295e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.187/aethyme-v0.8.187-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04603b12de164872b4571cc0f1e0f153ebb74d888f4f228748e374db636c5a88"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.187/aethyme-v0.8.187-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f7c9cad50bcbe8e299b919d352b18a388ff38e29015609df2956e88ba46990f"
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
