# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.134/aethyme-v0.8.134-aarch64-apple-darwin.tar.gz"
      sha256 "1ee9bb7e0e751e7e5969b4b18da1f9045cdf3a0e8395fdf44f6ac0836bbba02c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.134/aethyme-v0.8.134-x86_64-apple-darwin.tar.gz"
      sha256 "e17e2be40d5159be2f054e79b59b98ca6782b76f8fa427e11626bc83551d9ffb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.134/aethyme-v0.8.134-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "99ff540cf8e3f5aafe097c65a3f9b33593775b4958726488a03986a9409da518"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.134/aethyme-v0.8.134-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d071a90a97e126da93b40b0030884d0469a8ee446d08f5751f070a3c112809e0"
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
