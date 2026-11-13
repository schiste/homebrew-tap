# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.87/aethyme-v0.8.87-aarch64-apple-darwin.tar.gz"
      sha256 "7162abebb0b7080de490727369deccb207375d370b7ac17dd7a0070fc1c7b57f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.87/aethyme-v0.8.87-x86_64-apple-darwin.tar.gz"
      sha256 "33261dfbb9c5b07b61ba027de8e574daaee39bc680ca5acc3c9d444f580e9d71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.87/aethyme-v0.8.87-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef966140f180b225f39f5becbb7d4fa90d1170577225a627ba38b61181c252c9"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.87/aethyme-v0.8.87-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d56f1d4e1eea5f4d717c0ad1879d8b150d6a2f9584fa8dc59ec36675d1bb7db1"
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
