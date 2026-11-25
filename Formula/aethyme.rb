# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.178/aethyme-v0.8.178-aarch64-apple-darwin.tar.gz"
      sha256 "39275789be984a0165fc34c263ba9ffab295b44a438d96d6f38656a4f9a1f055"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.178/aethyme-v0.8.178-x86_64-apple-darwin.tar.gz"
      sha256 "50be8fb97b6cc302784a746d535fa15d80d914bbdde3bb88208455a3ea069e1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.178/aethyme-v0.8.178-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13efbf92f0e91e75559c3305a572fbf0bbb63158a31a6c77a82d3eca59ba8782"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.178/aethyme-v0.8.178-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d60f5037710c72e7c4096f70846fb53eca13c0170f9a8124ed3accaed8ee83c"
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
