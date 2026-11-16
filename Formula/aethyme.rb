# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.109/aethyme-v0.8.109-aarch64-apple-darwin.tar.gz"
      sha256 "7fadea233c2cb68e8bf91a0cc8099dd8709be4771adc2e8fdf6c46524b25a637"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.109/aethyme-v0.8.109-x86_64-apple-darwin.tar.gz"
      sha256 "ee240db44ab228077bc536d351d5d12458fd7754c678813685dc3ed18b71154b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.109/aethyme-v0.8.109-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69074ceb26809483c55892070a5be0e9162ec01d0dd01e797bc127286c87291f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.109/aethyme-v0.8.109-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5b08bd54d7b61883eec1e978f49c39cbe7c48aee61915a6116a0fa2c89b378e"
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
