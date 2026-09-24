# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.3/aethyme-v0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "f74426bf3fa5932dc5e4814d1e12af10bdc215d9cff81b9e36e2c87d5ae57dc5"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.3/aethyme-v0.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "22fa82384c06686810fc81d7efaf21e9663de1d10165c061f63eea47391399e4"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.3/aethyme-v0.8.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1876eb8c71f4ba31036654e7267093c468c5fc2107048f626016c48cbf29e481"
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
