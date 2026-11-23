# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.163/aethyme-v0.8.163-aarch64-apple-darwin.tar.gz"
      sha256 "ec11411b51980e914cd7fd7c53ed2576b231181c1a41075a024b5add5043a866"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.163/aethyme-v0.8.163-x86_64-apple-darwin.tar.gz"
      sha256 "bcddc49af4741439235d09c885894c04c03a6c7cbdeaa2f2cf1c7b7391920cf8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.163/aethyme-v0.8.163-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01f2965900a197823fdfc0baaffa84df066ae74cafca88a0533f11be8baef20e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.163/aethyme-v0.8.163-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2902dd1af00eb1cd7ac6ebbac24db45ad374feecc927ee61fdfaaa988b3014a9"
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
