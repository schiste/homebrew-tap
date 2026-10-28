# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.44/aethyme-v0.8.44-aarch64-apple-darwin.tar.gz"
      sha256 "d1765d8c6c6428a898eb5d7f121c11449b1e85d4214c02ccda424828d14a334f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.44/aethyme-v0.8.44-x86_64-apple-darwin.tar.gz"
      sha256 "93d6c1e8796acbec3a38f213766922340af1528de50daa5d468b459b42266650"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.44/aethyme-v0.8.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9129a552a9b05a3fc8c79fb2b2651fd178e83487307d97ecf17bd3766406ff3b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.44/aethyme-v0.8.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cbc5104aea56c1cb1b2c23152cc4109b7143cd43316e638f44a5a4a1c9a462c4"
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
