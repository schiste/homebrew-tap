# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.46/aethyme-v0.8.46-aarch64-apple-darwin.tar.gz"
      sha256 "4eb6f4113f777be8d043f25d6ae32d5314d64a172400c4c2cc793c1b1d5b9356"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.46/aethyme-v0.8.46-x86_64-apple-darwin.tar.gz"
      sha256 "1d51357b9c38eee5d23eac7a7482f96d22461b5464376233399e458de904b1e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.46/aethyme-v0.8.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c211d6b91cd13c24babe8b8376dff2e6a7c5414585dcc5fc661b671f4beca651"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.46/aethyme-v0.8.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "02b7563f8568b74d78e7220a68d9b387d2fc84281c28b541acca728832f9e0bb"
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
