# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.42/aethyme-v0.8.42-aarch64-apple-darwin.tar.gz"
      sha256 "e3c7adcab8a151144dc03817173f461f5d32308949e4ba3750dbb3249ffac492"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.42/aethyme-v0.8.42-x86_64-apple-darwin.tar.gz"
      sha256 "dd2d1de49f93494d12eabdcb6343ede7f2257b8581267d2ba1d23d7c11e452a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.42/aethyme-v0.8.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23903069ac2d9fb882a8d8aebbc8a0c42643249c7795ad512d1fa57a06f70b0a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.42/aethyme-v0.8.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d62bcbf59d7131b3b1959ed32359fef5d13d61bd945641e82126414322d4522"
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
