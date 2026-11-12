# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.70/aethyme-v0.8.70-aarch64-apple-darwin.tar.gz"
      sha256 "8cfae3a3df6f0231a9d927aaa7ca643f3bf8c6e50582aa24f1a3ec4287d84ce3"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.70/aethyme-v0.8.70-x86_64-apple-darwin.tar.gz"
      sha256 "204fd06fd0271971d25e0c70f32a85e07b671dcd1e7908770a3224eaeecdecb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.70/aethyme-v0.8.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b604009223793c4ea478d3832edae218dcf5fde07127e50035081dad9f73896"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.70/aethyme-v0.8.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b5c2a5df07d1123dd5c188c42ed9658a09273b79450e146cc1acad81a4da0ef"
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
