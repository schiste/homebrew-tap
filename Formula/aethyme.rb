# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.3/aethyme-v0.7.3-aarch64-apple-darwin.tar.gz"
      sha256 "80382de25230880b8b60eaf590ef9b667e7505008ab0107c3bd0a207d9612de4"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.3/aethyme-v0.7.3-x86_64-apple-darwin.tar.gz"
      sha256 "cdd16f3854a9eb5dc0435a55108b88159940b42e603b384a0c9ed95e79990bba"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.3/aethyme-v0.7.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be278b9198b29b235c190312af4baced5adc764d22668520f532e4b72bd4484f"
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
