# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.9/aethyme-v0.7.9-aarch64-apple-darwin.tar.gz"
      sha256 "706602bb3b7f910b658a52eddad4f78c55c5f46c98f115121b59142410824b70"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.9/aethyme-v0.7.9-x86_64-apple-darwin.tar.gz"
      sha256 "7c860ab983a6197e52fbbd010c413b7c2e0ab477f9086de2f97cd424b5c41867"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.9/aethyme-v0.7.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed07386a2e859786b53c79f252b20955664d1915153bab2e2682d049c83989dc"
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
