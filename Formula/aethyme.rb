# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.75/aethyme-v0.8.75-aarch64-apple-darwin.tar.gz"
      sha256 "c2332833a04e0a18fc2e9d2c813ef79674e92846c0ca144f6eb99c846b1e5ab2"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.75/aethyme-v0.8.75-x86_64-apple-darwin.tar.gz"
      sha256 "be833d888bf7a4e2927c0f35d41dec9e87d7fcdf5999c73849b684f3d14be1c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.75/aethyme-v0.8.75-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95431ff390eee18f38e236dc4b8ee057553c02f93db797608fe530f0c6a4f2a5"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.75/aethyme-v0.8.75-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f93d92ad0438cb499c4ad88e7fdf211659cb93fea06b8830c8f29c98899118d9"
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
