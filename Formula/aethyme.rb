# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.161/aethyme-v0.8.161-aarch64-apple-darwin.tar.gz"
      sha256 "e707d6504ab2642f25d0a97bd7fc6d4d03189e190464fe3b1956aa4e76ed42bd"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.161/aethyme-v0.8.161-x86_64-apple-darwin.tar.gz"
      sha256 "857c5f055547eac2a417d8c4244fa44a9713551b73f8c8c08cdd0432a36774c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.161/aethyme-v0.8.161-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24b97e2e2e8ea4c9659cb70ae5b9e8e7b3485fe9c92ee7b17b4a2bf98c0d00ae"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.161/aethyme-v0.8.161-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30c27c3d0a8654a363c4a43b753749148eca148c9e2df41c3b0b98728c4c1a47"
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
