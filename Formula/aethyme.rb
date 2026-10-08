# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.25/aethyme-v0.8.25-aarch64-apple-darwin.tar.gz"
      sha256 "f223814a9764be722a72bbf52cfe0546fa8086397894338d78db54ba3805ccc0"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.25/aethyme-v0.8.25-x86_64-apple-darwin.tar.gz"
      sha256 "10c228477e037bbfb174c200ace30d9a4b7d8b30482861ee10782ae474d2f629"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.25/aethyme-v0.8.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a862b100814930efc10d32887731195f9cb0fbe0d86b0a36c88f6390a6ed092"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.25/aethyme-v0.8.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b9d0984dbce7d8adc5a5a14fa3d0933f454e5b463495be8b94399691f30a6f92"
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
