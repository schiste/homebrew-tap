# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.121/aethyme-v0.8.121-aarch64-apple-darwin.tar.gz"
      sha256 "b22bd8138b1d51cd8a674b7d0e3362f4fbb0abe8e4efda517746385752d1ad99"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.121/aethyme-v0.8.121-x86_64-apple-darwin.tar.gz"
      sha256 "6675461357a79c6109c9ca88c0f345d993f809ca01bbd22cfb7f0bdc36217c72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.121/aethyme-v0.8.121-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "376e6bbe41f9e89ad304af87506c561d32b93d346ac2c6c7689ead389936f077"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.121/aethyme-v0.8.121-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ba81a750c6d7c3ac5bc80fc0815488f470e3920696795f3a00fda43d9a92a2c"
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
