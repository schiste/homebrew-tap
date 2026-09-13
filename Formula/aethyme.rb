# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.18/aethyme-v0.7.18-aarch64-apple-darwin.tar.gz"
      sha256 "327ab6e037dcf87df56e91c1d43971ac6d5a4f1e04beb1bf90fbeb66beec234f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.18/aethyme-v0.7.18-x86_64-apple-darwin.tar.gz"
      sha256 "1cfc7c49905bfd80dc1df2bc8f3fdba21766a40995a917c130cb6a421f5ba088"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.18/aethyme-v0.7.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "780b1e1a7574eec271ea79204177827ddc8cad39f3e9e27f2e6e10073355ce54"
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
