# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.132/aethyme-v0.8.132-aarch64-apple-darwin.tar.gz"
      sha256 "4c72b8a1a8737b9b982f1eaa83ee2ccf9104755ed64e99b3bcb4e42a447537fb"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.132/aethyme-v0.8.132-x86_64-apple-darwin.tar.gz"
      sha256 "81a51ac9fd505f757e42d8f80a6409cbb8c69102dac1d76e63678ed60b461e66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.132/aethyme-v0.8.132-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dff46581b415829894cdbda6419c7da025897b8b5e9203cec07514728f638c08"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.132/aethyme-v0.8.132-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f978558f1bef66cb678d567c1f3838c34e1b8e8cff0b00f4af17a7f0eee88e59"
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
