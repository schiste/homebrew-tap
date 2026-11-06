# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.61/aethyme-v0.8.61-aarch64-apple-darwin.tar.gz"
      sha256 "a8e67623e5a7a593626b660a0096b3e8330731b74789207b30ce209883fcb40b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.61/aethyme-v0.8.61-x86_64-apple-darwin.tar.gz"
      sha256 "a3d0ea65e178a2b8ba437664bfc384eb2fc15ca1337fdc99302f179af31a79a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.61/aethyme-v0.8.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90a696c61941f8ca2eff46247fa42ad0f2720779c1f2a840fdacc3d96bbdc4cc"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.61/aethyme-v0.8.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2a11b22e73b4458cb87a2693a96aa37783ffec0c3e043e7aa4e2f28f92e9e07"
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
