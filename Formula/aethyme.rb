# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.95/aethyme-v0.8.95-aarch64-apple-darwin.tar.gz"
      sha256 "33e7bd80943cee0504836ea94c5632f403f47fcb77a2aed677c3fda2cafcd4c5"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.95/aethyme-v0.8.95-x86_64-apple-darwin.tar.gz"
      sha256 "1a1a4475fc964aa2834b426a677d8fa0499edfe6e14e583a1378714a50a7a221"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.95/aethyme-v0.8.95-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4d04fe451c303658ac94ac6ad63050a481df5409dd27b6635e24c2a9223b726"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.95/aethyme-v0.8.95-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4531be019e4562795444e94d031882fa9023e7013e73b3b183718292b25e109d"
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
