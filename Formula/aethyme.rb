# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.135/aethyme-v0.8.135-aarch64-apple-darwin.tar.gz"
      sha256 "4026bbcffc946bdcff094bcd651c379cb523c96b5911dd91a7ac5e1c3e4c691a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.135/aethyme-v0.8.135-x86_64-apple-darwin.tar.gz"
      sha256 "1e6c5031373d6de19fa7981d90e63ba492ddb41b6b88136359435250277238bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.135/aethyme-v0.8.135-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9dad07036e8dc940fb42b7925ec417e737d47957fa7bb95bf30e2ea132e7ba63"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.135/aethyme-v0.8.135-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "284320c573be0882d13bf13ef1c75577c2e4348f6247f212bdd90fa077d75fb7"
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
