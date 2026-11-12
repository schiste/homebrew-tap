# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.71/aethyme-v0.8.71-aarch64-apple-darwin.tar.gz"
      sha256 "cbbe7b7bad764f4d516465be5aa89d82271684afd5baf27780fd83de72744331"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.71/aethyme-v0.8.71-x86_64-apple-darwin.tar.gz"
      sha256 "5ed4e50e91a19a890d1a07f42630ce3f3abd12daedf014e95fa9e768b8aa1281"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.71/aethyme-v0.8.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4536f917a810d7de992048136d25407ad905b5b2b08bcd6f05d8963c30b3121c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.71/aethyme-v0.8.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80fcdf2d7262e54bd3524d79fe0cea78b9da35bea1d57121248c66def48d31d9"
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
