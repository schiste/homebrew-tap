# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.142/aethyme-v0.8.142-aarch64-apple-darwin.tar.gz"
      sha256 "ee664e986d5d395ee3afe9d6ec5bd5c717d7ce74028a6477508481fb21f5b6dc"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.142/aethyme-v0.8.142-x86_64-apple-darwin.tar.gz"
      sha256 "8fb9100af9e700ff33eed9a5a0281dfb2a559f208003fe1c8bbaa7750779deec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.142/aethyme-v0.8.142-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a5a4041707b5893088eea4c67dcec4fe5946f77d63224399a94a880174d03f5"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.142/aethyme-v0.8.142-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2210a5be88d5eee0052a82f59ca35e2e46cca4e46bee6c6e8a15c77d295a8260"
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
