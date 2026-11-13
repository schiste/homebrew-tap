# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.86/aethyme-v0.8.86-aarch64-apple-darwin.tar.gz"
      sha256 "095dd10d68af4620663c071f5d40edb2be83b497c69ab71b98173424371792bc"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.86/aethyme-v0.8.86-x86_64-apple-darwin.tar.gz"
      sha256 "5d67239733b693717c091e2e950a1977c4b925c2ca3d8c870d4a01d83f1a0abd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.86/aethyme-v0.8.86-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd38b29ffe0f47b70dbcfa431c2a7536df777a8815e2c2522b848d117f4f24ec"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.86/aethyme-v0.8.86-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d34f36b76b402bfcc411e962f25de568efa467bcdebe42ea0c3fa83334e120f"
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
