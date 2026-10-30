# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.50/aethyme-v0.8.50-aarch64-apple-darwin.tar.gz"
      sha256 "2c319f6238b7e5765e9d64c975c59d5330c811d060735869559390fec871bab5"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.50/aethyme-v0.8.50-x86_64-apple-darwin.tar.gz"
      sha256 "279cd8f0c43f35bc6942557a05b8957bc4f41909883f9ce0c0e575a8c8941dc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.50/aethyme-v0.8.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6b70b20ebae3e8891e8dda3bcf47a9663af253c22ee49773a50800097cd49d0"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.50/aethyme-v0.8.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f36fa2d890baf466fd329a814bea863c9e38125729a87618699ba09df91b9f4a"
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
