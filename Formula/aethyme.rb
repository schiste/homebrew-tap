# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.4.0/aethyme-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "9365bd61d9d955059a12327e6270b84414c062da58a15254b2cf04d6ca76ced6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.4.0/aethyme-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "65fa580f4db076b3d24f90523a884b828e7bdfeb7abf9f9f2f68bf783260dc9f"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.4.0/aethyme-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed8653a7b23dc03de059e4aa0beb872fc3cac641a0c3a6dfc53d50b958763144"
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
