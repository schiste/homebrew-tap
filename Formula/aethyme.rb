# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.174/aethyme-v0.8.174-aarch64-apple-darwin.tar.gz"
      sha256 "90fc512deb24275711d85f0d81e13a1234d11b1fe775616360cf42fe090a9d5c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.174/aethyme-v0.8.174-x86_64-apple-darwin.tar.gz"
      sha256 "f61282886dc060e138bda1e36fd0ab433fda5488de977100558a380331d5db4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.174/aethyme-v0.8.174-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c3cf553e28c959ddbf1c5161cd9f2533c42695e0c67eaa9bc3278e4d3f61340"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.174/aethyme-v0.8.174-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c86e147b43a7cfd72eed693abf64070639a33d79da8920a5103b4a7c8a63434"
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
