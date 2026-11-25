# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.179/aethyme-v0.8.179-aarch64-apple-darwin.tar.gz"
      sha256 "9d74694f7e6f37827bf8722d2ebba2c6385e07d0fbc8a7863c20de90e0fbef3c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.179/aethyme-v0.8.179-x86_64-apple-darwin.tar.gz"
      sha256 "eff241444b3540a928554554ff93d1d005b82bfb56384981624a2684cdb86a6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.179/aethyme-v0.8.179-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fa185559c2fb62c2d2c49cd84096d2947ae185bb639305ebe3c9652df7b4a15"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.179/aethyme-v0.8.179-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da6e97ba13a60c9c91b4b154c9460e13032d49ae8f33ca7e38b9935983a56861"
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
