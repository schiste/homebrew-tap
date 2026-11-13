# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.84/aethyme-v0.8.84-aarch64-apple-darwin.tar.gz"
      sha256 "93bdb910a4a76e10aeffdd3052a5caab0e5aa68298d0633c986665fffb010507"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.84/aethyme-v0.8.84-x86_64-apple-darwin.tar.gz"
      sha256 "413128fc591771d66d7c49decbc7d00140d95dc94d25ae84dbcdc38ae5e3abee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.84/aethyme-v0.8.84-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7288287e5d16a39b44585b0fad7188085ea928ba268c4303031c7227a1ce2157"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.84/aethyme-v0.8.84-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c5cc5d7c6889f35dfbf1f245d303e5ec3a78afaef5d1add53d390ee48d32ce4"
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
