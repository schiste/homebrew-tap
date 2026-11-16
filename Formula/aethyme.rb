# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.110/aethyme-v0.8.110-aarch64-apple-darwin.tar.gz"
      sha256 "a814d5b7d49172757efa3065c2a496ec79a89fc82067de02cb7e61c52f613306"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.110/aethyme-v0.8.110-x86_64-apple-darwin.tar.gz"
      sha256 "6cc3019ab5df24eab20f46072a99cd6aaa36709e58105e6c0b7e7ab9779db123"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.110/aethyme-v0.8.110-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8eced42b190b9116627dbfc1823df63aed374397090d83a689aabeef217ff300"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.110/aethyme-v0.8.110-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "092faf748c994c398347c429fe4eb10e1431d6fff0c2f2b1d8d3725e5140b20f"
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
