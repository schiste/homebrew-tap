# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.2.1/aethyme-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "4af81abe7429434311be5bb7d1efd9d788b759e071004ccea76506078d3c6763"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.2.1/aethyme-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "aa1187d9873db57da4155523f07fb8192d1117fa585b411dd4bf25de70c0967f"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.2.1/aethyme-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "640de34ab5f7ac11750e1bf583fb3ff6aec004fe19abb8e77d174210b9cf3ccf"
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
