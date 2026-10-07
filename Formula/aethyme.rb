# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.24/aethyme-v0.8.24-aarch64-apple-darwin.tar.gz"
      sha256 "82468a8a1af07a38cfb632951a14a9d76f9900013848d894de1a24128499a952"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.24/aethyme-v0.8.24-x86_64-apple-darwin.tar.gz"
      sha256 "37a32a5eb8a08154b7885b349028241f886aba9cbb7f7d6a4a0c56ac82e4fceb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.24/aethyme-v0.8.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95c36958e17146001eca8b962547c28488262e5173a4eeb348119942775f894e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.24/aethyme-v0.8.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e650ac0b0cb063a0d10f873302bb93e339d61275d487fe0100ee5051584ce2c"
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
