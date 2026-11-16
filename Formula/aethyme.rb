# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.107/aethyme-v0.8.107-aarch64-apple-darwin.tar.gz"
      sha256 "0276e13870576a1742d757f1b7e4a4c2c71f961cd685f82a4d182257c21d6552"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.107/aethyme-v0.8.107-x86_64-apple-darwin.tar.gz"
      sha256 "66ac38bf77cfd1c01b5e0ea5f7414a2f63a7dd4c1eb51ac9995dcf970ed65701"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.107/aethyme-v0.8.107-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1be0dd45f59e64c594007156c41403479b49ea43e02dff879e771936be3c5732"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.107/aethyme-v0.8.107-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97163769ca94a885fd363a75df0aceaa3bee0017cd240ba753baed4cc876e39c"
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
