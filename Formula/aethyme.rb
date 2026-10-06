# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.22/aethyme-v0.8.22-aarch64-apple-darwin.tar.gz"
      sha256 "f1257827ad87bb8afddd5271bef96de232dc7fc46917f88d768298f96e3f614a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.22/aethyme-v0.8.22-x86_64-apple-darwin.tar.gz"
      sha256 "8e7f7f7302c528ec796ac0b89ef98e1f143d23e0ec3879d71773b4827d1d4ce1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.22/aethyme-v0.8.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eaf349299dedfcfc4dd24e1ae775a3d3e1eb0fe45915879013f96ad3cf4d023f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.22/aethyme-v0.8.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b9d11a517e5eb05b0655bef2404114b06269707d8e7a235fdc467bce1dec9e83"
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
