# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.13/aethyme-v0.8.13-aarch64-apple-darwin.tar.gz"
      sha256 "81cac89cbcacff6a361c481ff47db8f79b10ac15172c99941bd7bd81afddcf70"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.13/aethyme-v0.8.13-x86_64-apple-darwin.tar.gz"
      sha256 "c4f1ec2d6abad805f024d27fda1ed342b24e275a1c84e696914dfde3e3cc0a7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.13/aethyme-v0.8.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f59bf9b9d8ced8eb9a6a26cedae4ef7f4a7ed36b013eb5c129bce48719cf1bf0"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.13/aethyme-v0.8.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5aef60ef2e81428430899bd59ce5f66cf17d0d641f0c916ecd66a0b2e2d59a0d"
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
