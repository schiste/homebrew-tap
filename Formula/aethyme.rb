# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.104/aethyme-v0.8.104-aarch64-apple-darwin.tar.gz"
      sha256 "8c2cdd823826cfebda5c22d0c6dbb753f175295fd1f50e7d1c6aada414e89411"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.104/aethyme-v0.8.104-x86_64-apple-darwin.tar.gz"
      sha256 "e26e4cb0f27c75421f493530e023ee1ea8d81cc236e4196021ce026e88fdfd81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.104/aethyme-v0.8.104-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f45092dd1088088e7791b9135f35eee2bd8b315a178b5da0889d02184442db08"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.104/aethyme-v0.8.104-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46c05df00d2e79a8ac725b6f79fec41652cdad5563ec506f5e44ff5ba1b1f744"
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
