# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.0/aethyme-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "5168bd71153fe069836527e12df8cbd81ef4193627ac3d47868566db6a62e68a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.0/aethyme-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "7d73e3194bc5862217e7a0c97e85cee65bf2a812e951b7b21b26e34445696685"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.0/aethyme-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d352f5c00bec94c5d096257c7dd394646806d5e1378b9a045ef0b144f7180483"
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
