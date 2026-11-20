# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.141/aethyme-v0.8.141-aarch64-apple-darwin.tar.gz"
      sha256 "9490085d656c70cdc6de62952d6b01c88bd0c76c96e191f2df8f276f4b120230"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.141/aethyme-v0.8.141-x86_64-apple-darwin.tar.gz"
      sha256 "93992e935538ab83f3211b2f6c83b2aa86dbeaa739e4bb3e03c13c5189dd9b7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.141/aethyme-v0.8.141-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e94b69f4ae44bbf480004fef725922fc05ba073941098bbf398d60f3973f9360"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.141/aethyme-v0.8.141-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66be8bf2fbe48381ca2c8f99b7620116e885b23b293f1d220542cac1eedf1f4f"
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
