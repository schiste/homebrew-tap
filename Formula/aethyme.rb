# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.101/aethyme-v0.8.101-aarch64-apple-darwin.tar.gz"
      sha256 "d55e0a75399809f9e096835501245d595b312496be1a10b81557ab78d0f1c703"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.101/aethyme-v0.8.101-x86_64-apple-darwin.tar.gz"
      sha256 "decefa80102ceba14d658caa8968a416c0a33912e97611cbfdd5eb4d0a0b079d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.101/aethyme-v0.8.101-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "199994bd045e0ef3b05650c76eaeb3e9910c7ca4e8db6f91546e93d8a0ef923a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.101/aethyme-v0.8.101-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37d6e218a040c6103e6e1c23ab2bc551f1b56a847efadcecf41c0e4e719151b8"
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
