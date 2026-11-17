# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.118/aethyme-v0.8.118-aarch64-apple-darwin.tar.gz"
      sha256 "5b1f242b9095e8a6bcdf04f2ffddf951cc535d2d58b265bf3e26166cede1cf2c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.118/aethyme-v0.8.118-x86_64-apple-darwin.tar.gz"
      sha256 "04a059d59e91d8f6e736ddc2de41c8aaf3bae1b159c6b0ca2c7e8a092665c0ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.118/aethyme-v0.8.118-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8515ca530fb3efaf9c22ad5e25eee0036dbdcbba629da16ed0c887457a3aca43"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.118/aethyme-v0.8.118-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f20bcb646f944c310e4fd74116f415fe0eeabde3d86fe9d628e2670ec9eb7716"
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
