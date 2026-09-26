# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.5/aethyme-v0.8.5-aarch64-apple-darwin.tar.gz"
      sha256 "c61aaaf99bb00f2c9ab6951915acba7aad9ae9828a6da3103b28143820e1f0e2"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.5/aethyme-v0.8.5-x86_64-apple-darwin.tar.gz"
      sha256 "b632af75085aea7156a927fb4a7432b1a4e787191967b1805023c4d6082a6774"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.5/aethyme-v0.8.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bdee05cc19ebd117301f26ccaa4ce2c455d15e2a00bd8b4ff34d5e7b4b0e020a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.5/aethyme-v0.8.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "265ab900f503c53b7f7f329cd48f541d98ac2a08ce4ebea468f84373f1d032a7"
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
