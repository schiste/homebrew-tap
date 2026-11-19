# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.136/aethyme-v0.8.136-aarch64-apple-darwin.tar.gz"
      sha256 "e00ec8c2053868f90b29cc0a48829a0c16f7e9b866bcfe0ba326a9d6d702fda4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.136/aethyme-v0.8.136-x86_64-apple-darwin.tar.gz"
      sha256 "855c355ac572728a5726bcd7cb407926187f70542bc85fcd28028170b0346eb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.136/aethyme-v0.8.136-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3349a1392f9cbd257cb86ab6c74e24d2b85302d3e4a418a85337e796d2c14512"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.136/aethyme-v0.8.136-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "acf863e3b5f6026f7d5ee680f1d801734407821ae35c4455ef176d2b07724e04"
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
