# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.165/aethyme-v0.8.165-aarch64-apple-darwin.tar.gz"
      sha256 "2f89bf34daf653da93753f9fad4430c3e22da3d0bb55a2a57a55406718ff652f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.165/aethyme-v0.8.165-x86_64-apple-darwin.tar.gz"
      sha256 "1cc4666123bacf97223b9dca7dc72de92e78190c9b25d73ca74120b7328e0bdc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.165/aethyme-v0.8.165-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df2cd032cdbb97f1bcf2b5dd11c45914e432b865e174c8e68fbe75109d7e9700"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.165/aethyme-v0.8.165-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7931eb55da3827db513f7c33749fcd296119f6f578b980487eb396e1799209c"
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
