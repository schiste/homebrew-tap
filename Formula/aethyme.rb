# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.116/aethyme-v0.8.116-aarch64-apple-darwin.tar.gz"
      sha256 "4ea5efbdce3398635e0eb37f50b39356bd57d3c74801e1750b3a0f3d30721fcd"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.116/aethyme-v0.8.116-x86_64-apple-darwin.tar.gz"
      sha256 "c3d8dc57b92af3b81777fbc6c7d41e940eb38410decdcb609ad412d0fb1adf89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.116/aethyme-v0.8.116-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad3c0a08bc052708db721e3098d2e14c122af8b65a438d60e804cf70053224b0"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.116/aethyme-v0.8.116-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ca50da377b0af87ebcdc4d053a8642d1efd86228c13d24c7e3517fdcb4a77fa"
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
