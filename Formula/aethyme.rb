# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.82/aethyme-v0.8.82-aarch64-apple-darwin.tar.gz"
      sha256 "1602843a716f9b776756353d3ce97d1a5eb902bc5ca97e87d37dac856f5194df"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.82/aethyme-v0.8.82-x86_64-apple-darwin.tar.gz"
      sha256 "54b771b8db117ff647091f51b999a382597bd4aa753c6272a274d994f19eacae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.82/aethyme-v0.8.82-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dede8bdafeee2ac5063db27dfea5650083adff9a55d4db296301489009d49e7c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.82/aethyme-v0.8.82-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79e7e6f09459bacc2f1eed14877c9a03cf14600a92da56484e3145ea86240cb6"
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
