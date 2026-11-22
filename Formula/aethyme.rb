# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.159/aethyme-v0.8.159-aarch64-apple-darwin.tar.gz"
      sha256 "35bd8b4c43d506d0f4f6c53d7679b39f5a135c1f72e3a9668623482f3dc446b2"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.159/aethyme-v0.8.159-x86_64-apple-darwin.tar.gz"
      sha256 "f0a01f8af6ac65899367ffe40cb73dd1ef61a8cb73a8b0ab6e2891e0377985d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.159/aethyme-v0.8.159-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc15c7d7a90fc6d9b9c661539ec63bbbd91c7401c1936ef9822135e5ecae337c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.159/aethyme-v0.8.159-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "657f7cc18f6a6d115cc75814e01d7caecc73ccf5b3641ffcbb89f1b4e01aeb6e"
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
