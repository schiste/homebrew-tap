# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.146/aethyme-v0.8.146-aarch64-apple-darwin.tar.gz"
      sha256 "43d3ff057575f2edb8d1dc783d44b3236d9e1eebd2082f99900c1018777a000a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.146/aethyme-v0.8.146-x86_64-apple-darwin.tar.gz"
      sha256 "9f1f72c1b90f3d190f982892fdc365e7cc307754f67c55aa007821854a93cdb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.146/aethyme-v0.8.146-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "780ff2b105a5bf644fefa90e444c21dcb525b8b78d227af7374df9e6c79ca1a3"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.146/aethyme-v0.8.146-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0226bf3dca20faa12ea85261b557c35182b36385ee7d162d925a6053057ef87d"
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
