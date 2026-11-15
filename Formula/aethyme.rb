# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.103/aethyme-v0.8.103-aarch64-apple-darwin.tar.gz"
      sha256 "68d33695ede0ca834da1170ac62ef881e41afaf47ec25adbb69af3478ba74dba"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.103/aethyme-v0.8.103-x86_64-apple-darwin.tar.gz"
      sha256 "224246ad39f1768ccc5496d25de341d1f9ca05fef87a5c11573ef87272e27873"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.103/aethyme-v0.8.103-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbd31835182f958b45f15500d3cb6c811fd3e9907d8beb4f681413b530b50185"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.103/aethyme-v0.8.103-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35d2728f033a5d7cc8d5ab43766285f3e179d272978509ca7a9a7fd73fb3cd5c"
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
