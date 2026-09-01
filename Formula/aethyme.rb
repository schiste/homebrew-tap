# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.1/aethyme-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "37f4d3959e28241c95f43917d251246ebd65e668891de347f1c16d2339046fbf"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.1/aethyme-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "9108fec85873a83e32a5ef01d25454a4fd9d3d6a148d38177cadd674463f2691"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.1/aethyme-v0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fea2ee8b977222d3941d48ec8dc4aeac488df81e1ec12f804ee596f9863907ba"
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
