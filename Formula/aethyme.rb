# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.67/aethyme-v0.8.67-aarch64-apple-darwin.tar.gz"
      sha256 "908835d3da4432afbbf8f256658d7da422978b34155b0f973cd3aad537606ca9"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.67/aethyme-v0.8.67-x86_64-apple-darwin.tar.gz"
      sha256 "3715287ca8b768687a868fb93145e9214abe5661e1b1557f486ef97b1dbf361a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.67/aethyme-v0.8.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30b93669a7909fb019927bf723f50324b28f32e49235995708d8a0ae331e9c45"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.67/aethyme-v0.8.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "156afab8121edef752d8c1bdf3151f3f5b295c81da393d4e02ff480dec3f5d37"
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
