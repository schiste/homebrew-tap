# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.12/aethyme-v0.8.12-aarch64-apple-darwin.tar.gz"
      sha256 "4a87e81a98e8888f215c054019e483286e11877af023b68ad913c6e74f4446fc"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.12/aethyme-v0.8.12-x86_64-apple-darwin.tar.gz"
      sha256 "878dde78e596b330dbecbc1ff9463b6cdf0448749734c798e6189824a569f3e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.12/aethyme-v0.8.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b4d3f5fb75ba56ddf35a683c04a390bbc278f7a9acb21ed7323300f96f747e0b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.12/aethyme-v0.8.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f827312841096ac0fcc2eef47286c5e82697b68cc55df03df36464a77238ceef"
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
