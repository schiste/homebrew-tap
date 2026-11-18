# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.127/aethyme-v0.8.127-aarch64-apple-darwin.tar.gz"
      sha256 "6754ddcc5d47d059ef250ddf39e45a6e67bcd10ebecea09e4affd8311736c5c3"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.127/aethyme-v0.8.127-x86_64-apple-darwin.tar.gz"
      sha256 "21275f56cd3a73e4a48def5cf225ef09fcd338fe2514b816971b40c989c94a85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.127/aethyme-v0.8.127-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "587198b009709816af4d15a9f33007cd01916db7e63705d103a28bdccfa43b1b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.127/aethyme-v0.8.127-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27fe779117feca0ca8254f7954e165101d443eeac59c32bbfbd7bcab00467ae5"
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
