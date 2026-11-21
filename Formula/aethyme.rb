# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.149/aethyme-v0.8.149-aarch64-apple-darwin.tar.gz"
      sha256 "350b2c361db61d0ad09137df5e1914f7ea63491ae170eee0bca4144e250fca49"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.149/aethyme-v0.8.149-x86_64-apple-darwin.tar.gz"
      sha256 "f8cdb220e3ac4ddf6da95c7c2b437511ca09c612b47b07572ca0b8d1a82d3bb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.149/aethyme-v0.8.149-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "861a884efd2fdd60a5bf8b86f4d42629e1befede94490be2e33f3a6f4713a018"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.149/aethyme-v0.8.149-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8deaebf7c235ca3c39c709c5c3d57ce215746fba6cebbe9f1967d95b482fddf"
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
