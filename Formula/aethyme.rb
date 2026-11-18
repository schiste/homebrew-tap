# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.123/aethyme-v0.8.123-aarch64-apple-darwin.tar.gz"
      sha256 "2da5ef572cf49cf8da156fcf2bbfb4b7b933481d13ec8c3dbcb5f77486d6d986"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.123/aethyme-v0.8.123-x86_64-apple-darwin.tar.gz"
      sha256 "c22a9708c82a4e758b3fa32453d01b21144b89f8006910b82e93c3c91488d1ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.123/aethyme-v0.8.123-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0ab676230af9401e527b72c72fd941cf41b16071ed5e301894ae38be133b043"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.123/aethyme-v0.8.123-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09bba9be1229d2d21346548420e9991ae38f951ba3a1da5e908e750899815a91"
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
