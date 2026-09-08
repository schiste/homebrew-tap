# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.15/aethyme-v0.7.15-aarch64-apple-darwin.tar.gz"
      sha256 "0d1e57d9bd24b51dd7a4ed6909d686a10a9233ae03e2adfae31ddb1df23b702f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.15/aethyme-v0.7.15-x86_64-apple-darwin.tar.gz"
      sha256 "92e902f5149e917c9df7c6752ac1d89bd985a1fe12fa778533f9867338d34636"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.15/aethyme-v0.7.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6d20cfd6cfcc21bd4143f94c0c4d4434b6ab18267c2d4af1985604eed1f40fa"
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
