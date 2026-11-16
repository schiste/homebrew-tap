# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.106/aethyme-v0.8.106-aarch64-apple-darwin.tar.gz"
      sha256 "62fb420edbeb739af57adee3607ee16479091e7a5a733c1069f06b72463f009a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.106/aethyme-v0.8.106-x86_64-apple-darwin.tar.gz"
      sha256 "9cc89faced0949301cd8cb94aa8728babff3b4e9ff5a1ce23ea3521dc16d4277"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.106/aethyme-v0.8.106-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a014503a1be02969fc34354b2b5596c890f75f33187018e7162b6aa0d72939ae"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.106/aethyme-v0.8.106-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e20f22c04a61e81abcd462eb962080688a52b333c5cf054eb6030775cbbb6275"
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
