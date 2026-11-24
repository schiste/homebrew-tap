# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.164/aethyme-v0.8.164-aarch64-apple-darwin.tar.gz"
      sha256 "979e5d40ddd4a92d6018b284fb474f8675a1ffb7ed82e093187c746661c098b9"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.164/aethyme-v0.8.164-x86_64-apple-darwin.tar.gz"
      sha256 "4479decabcf3ca7d0ee0918e87e3658a0410a97cec47836eecff61b9b83ddf57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.164/aethyme-v0.8.164-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c377094687a3e5c5e31279efb439127f227fa5e43d087fd63311d9c44473c80f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.164/aethyme-v0.8.164-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ae8609df96bd2442d1ef438760f0114a79bd3eace4e832b95c3c318048575835"
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
