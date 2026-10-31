# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.52/aethyme-v0.8.52-aarch64-apple-darwin.tar.gz"
      sha256 "cb02755c3517974e25bab791cc50cc3c16cf2f393b5d376490de79dcf44e2d99"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.52/aethyme-v0.8.52-x86_64-apple-darwin.tar.gz"
      sha256 "90af2d4f0ecca55d499c396bb74145b44b8c02bfb1c31170dce88259f23c5aba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.52/aethyme-v0.8.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be966129f892970135c810082300ce8c13b3f29dbd2daa57c54af6ca87220187"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.52/aethyme-v0.8.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1116a21c2b98fc351c5e1d26222976f3ceb6145d629b377ca06601aa60768d7a"
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
