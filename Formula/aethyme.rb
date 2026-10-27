# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.41/aethyme-v0.8.41-aarch64-apple-darwin.tar.gz"
      sha256 "c3ec8af6d60585dceb2d8e048ae2982f6c58365cdabfcadeee0edf9d6836beed"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.41/aethyme-v0.8.41-x86_64-apple-darwin.tar.gz"
      sha256 "873012adeee0186600fb79b7351bc1e25fcb308137b5258e8056fe0270eb751b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.41/aethyme-v0.8.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c46e22379919088bee891d1a7867246535667ba5b5dad2a0a6109868250e804e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.41/aethyme-v0.8.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d1f1bfe08694103c720131db0fae3c24c948f56db19e060d654780739c54afdb"
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
