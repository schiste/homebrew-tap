# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.120/aethyme-v0.8.120-aarch64-apple-darwin.tar.gz"
      sha256 "57b69f0c6db3fd6a32f9fbe166b4fc50f081540c6f2a7666a01258556cce397d"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.120/aethyme-v0.8.120-x86_64-apple-darwin.tar.gz"
      sha256 "0e5d4cfdb0348b83b2b4aa0158e273e66da5b2038f1a5ec7b3b9704a02606388"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.120/aethyme-v0.8.120-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b8ba66a56c757f9f2dd1d6fe9a45c7e6b0fd093c23d94b0cc3a4980ae1c0b71"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.120/aethyme-v0.8.120-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e883c691cb1e50db57790b00a0c6cbc69b302cd2b3469d7b179af25befdf9fe"
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
