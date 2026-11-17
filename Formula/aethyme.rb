# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.122/aethyme-v0.8.122-aarch64-apple-darwin.tar.gz"
      sha256 "60f8c6a923e60f25da73fc4d1b2d986a04d2b7e6b246bc15b24843c34c0e65a3"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.122/aethyme-v0.8.122-x86_64-apple-darwin.tar.gz"
      sha256 "fa515eb23911d576524d97b60e49ea55c42783933f9118c6e8065b97d88301b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.122/aethyme-v0.8.122-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5f5d97a736ca95aa5aa077c446aae423a0e9402e304bea97c7196aea0f8af54"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.122/aethyme-v0.8.122-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30e4e3b3276977565ee1b178c4e07e6fbfa636ac6e84431a91cf76b6305ed799"
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
