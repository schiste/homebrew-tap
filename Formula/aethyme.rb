# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.33/aethyme-v0.8.33-aarch64-apple-darwin.tar.gz"
      sha256 "f5da99f57ad61e45e4e7a0d58eacc0b8dddd748469fc81b32585c4c7ae74d5f8"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.33/aethyme-v0.8.33-x86_64-apple-darwin.tar.gz"
      sha256 "9b4a1947d7042cf875f7ee690c9b081f4a35ecee6a3f7047950419894799175c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.33/aethyme-v0.8.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e26901988dcd9881a72e64cc231ce935132017f015258b7aff2df2b81c4848f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.33/aethyme-v0.8.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3c895d025401c239ea2a186678b51ea046c2fa6702b8404ce810c59d20534ad"
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
