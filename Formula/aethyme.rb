# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.72/aethyme-v0.8.72-aarch64-apple-darwin.tar.gz"
      sha256 "3b451c04f0f18b8bdda5fd1101432be38705fadbc8ba641e1ee916eade35e12a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.72/aethyme-v0.8.72-x86_64-apple-darwin.tar.gz"
      sha256 "4172a117ba77ce7e78972169358ec61649cb2f01d9e8d98cbdf055a14562dec5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.72/aethyme-v0.8.72-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aba7f428f3109e5198c64540c5c8e5b92f67c7354801f77cf6ac45c97565d119"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.72/aethyme-v0.8.72-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fcc9246acdc637093212336fcd590ea0bdda11e9b54f5193cb3cc28706518c67"
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
