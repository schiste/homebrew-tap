# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.150/aethyme-v0.8.150-aarch64-apple-darwin.tar.gz"
      sha256 "791aac99839454be4fe9aa66162208a273aaf94f8d6138b1abe04d93953c1b41"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.150/aethyme-v0.8.150-x86_64-apple-darwin.tar.gz"
      sha256 "616c6785c1db1ea64c5fbf1d3a439880c63712d036c8cc6cc855f5d2ca0e28fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.150/aethyme-v0.8.150-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5839f8fae6d7bcb8a29a1223996a581d00f3c520291e29111006ed96d2a8148"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.150/aethyme-v0.8.150-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d2539101536599d1e9ae59939b19d7a36767393decc3f8ae21f8d11e667521c"
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
