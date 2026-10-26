# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.31/aethyme-v0.8.31-aarch64-apple-darwin.tar.gz"
      sha256 "0949bfc4a57d7f861630806d44658e9784b56ada7826d286264edfd1ac1e0523"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.31/aethyme-v0.8.31-x86_64-apple-darwin.tar.gz"
      sha256 "11f2b740c661efb137f14b0bb63bbdbf998166736078bc24ce0aa92d73fe701f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.31/aethyme-v0.8.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4633f5f0084c5a78055380ff100f66a1ae9b5d863ba57ddb1399727f64c52b38"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.31/aethyme-v0.8.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a14afebd6d9dc70e38f0ad0fd0687d4060929ae7ba406c032ae064cc90504488"
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
