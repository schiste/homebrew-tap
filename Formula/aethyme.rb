# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.16/aethyme-v0.8.16-aarch64-apple-darwin.tar.gz"
      sha256 "ae79cc857c57492d1208ea1aa25c0eb1477f67ba2a4995ebcacb66a7641851af"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.16/aethyme-v0.8.16-x86_64-apple-darwin.tar.gz"
      sha256 "c291c88070d20091e13e0656222cb78b4500dcf40ca165634ebd3250125d4eb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.16/aethyme-v0.8.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "691e90a5c88dad8eb1ce1feb6a9169e42380629d7174cd8396b5611a95275c37"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.16/aethyme-v0.8.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e142c2835d47b29546f93ceee02023743ebf6b6045c25bf8da45c8404b97fd11"
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
