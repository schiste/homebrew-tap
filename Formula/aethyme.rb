# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.185/aethyme-v0.8.185-aarch64-apple-darwin.tar.gz"
      sha256 "ddc29af09bcfc896e36dfeef46d9451f49625b3ec2397de0b997ebc02e9b81f8"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.185/aethyme-v0.8.185-x86_64-apple-darwin.tar.gz"
      sha256 "a966bf586c9671f08d18c152885e1acd64adb2e8ba76de073f583551fd04b7b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.185/aethyme-v0.8.185-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2f82015fc7c107f6daa582185da76db4f2e84ff5e5a47fd182618740a371f5d"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.185/aethyme-v0.8.185-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab28a29951c6771f60545989211a17fc3d97758f3c92e3bb5ce00ace00da810b"
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
