# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.111/aethyme-v0.8.111-aarch64-apple-darwin.tar.gz"
      sha256 "6a236651f1f74d705672499102c901992f32bd26ec26a8ca29709d8d8f8607a4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.111/aethyme-v0.8.111-x86_64-apple-darwin.tar.gz"
      sha256 "2a309e5fdf4dc38389b41f13eaf8fcd8e9998a07fe516b5eea775f52cec2254c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.111/aethyme-v0.8.111-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6bc3502a8693d9fc6c8c509b0f7eb23f21ea1e62803f335fe1c420c1e0492f67"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.111/aethyme-v0.8.111-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3605bfca4360213dc26d18fa087ad2642d3461c0b311a62df8855c9132f52da2"
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
