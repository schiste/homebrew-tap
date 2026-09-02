# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.2/aethyme-v0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "ae368822d726b6d15cbb055b99d8eac677a94d443126d08d93e03065d1efc487"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.2/aethyme-v0.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "fa9cec4a23a95a27f29f6349376cc40b133b0dce661757d9aa55cddcc765c6b3"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.2/aethyme-v0.7.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be77a8877e9f785383940d942b33e1747369ba268fb23e8d300190f0c39a3bab"
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
