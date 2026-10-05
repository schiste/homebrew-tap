# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.19/aethyme-v0.8.19-aarch64-apple-darwin.tar.gz"
      sha256 "4288afdefce3c1d0802170561a45ea63e17fddf3f4b9caa88a82e0141f145689"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.19/aethyme-v0.8.19-x86_64-apple-darwin.tar.gz"
      sha256 "543126cf54135020697ce5f63aae1e95e68b4531736cb2f4b70bac7c414012de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.19/aethyme-v0.8.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "11e3b41f7ade0e67f3f91ed275d4bda9f09f1441ef3f1d2cf8c170046f6899c2"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.19/aethyme-v0.8.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f2732c0f5b97746d9dc0b117bfb4ec4a0a1dd0601427f8ba94201204537882b"
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
