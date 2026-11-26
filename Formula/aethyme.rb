# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.183/aethyme-v0.8.183-aarch64-apple-darwin.tar.gz"
      sha256 "3318f31776b922870345e0baeed55f6493ae29508d20179e12f50e63f5aeb388"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.183/aethyme-v0.8.183-x86_64-apple-darwin.tar.gz"
      sha256 "51fc848e0784de81df29893db55974c88249c4e60895bbcd69a9e3787b477db2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.183/aethyme-v0.8.183-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b7d68a2afcb4ab77f8ab3fe05136eb8defde3e1e6c0db585bf1c25a4511a45fa"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.183/aethyme-v0.8.183-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3cb67fc5c0cbb75886a30050cd22f6e93df9b6fd5ec73c015549d4e26b1a88ab"
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
