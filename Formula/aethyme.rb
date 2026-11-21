# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.148/aethyme-v0.8.148-aarch64-apple-darwin.tar.gz"
      sha256 "e234a3d621302aca8adfe003c18cc5d11c47f022e8a88e6cf2be16bf365ca171"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.148/aethyme-v0.8.148-x86_64-apple-darwin.tar.gz"
      sha256 "63a77f50425335bd06b4171a318253368f2de67b62231839bb2a0874f069c986"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.148/aethyme-v0.8.148-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f95a00c26b790b1b7f795ce839921ccbe7657b2fcfd1ff85528393862e09c644"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.148/aethyme-v0.8.148-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dedbb5d68423c9e7ade5ef1a100bce68ae71a450bb2d33912d6274ec4cd67387"
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
