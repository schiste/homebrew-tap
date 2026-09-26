# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.4/aethyme-v0.8.4-aarch64-apple-darwin.tar.gz"
      sha256 "45edade3e866ee0df7464c57d20cf572f7e90b9ba236962d1b22c592312fd3a3"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.4/aethyme-v0.8.4-x86_64-apple-darwin.tar.gz"
      sha256 "291c273a866cf81da825b98a6b55cd20674da3114d91feb8f06c23cbc0af0a0f"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.4/aethyme-v0.8.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41907659cf065418151949303da8ffeb09177f45a48ad248ad9aa53436f3b427"
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
