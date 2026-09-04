# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.7/aethyme-v0.7.7-aarch64-apple-darwin.tar.gz"
      sha256 "216c6d898a85a204d61aee32d67c207f4bbd189e189db91f925cc428f8351afe"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.7/aethyme-v0.7.7-x86_64-apple-darwin.tar.gz"
      sha256 "25ffe95ac726ec3f80bf485ffe7504c71d99f0dc5bf6f0af08a7f5732f0dd598"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.7/aethyme-v0.7.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdc68098f5418b934c1bf6a2a5c8eb26bfa0f257e77375431b4043e96b48b2e8"
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
