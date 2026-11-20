# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.143/aethyme-v0.8.143-aarch64-apple-darwin.tar.gz"
      sha256 "189cff0ddf649a462b99144690e90ae5ca12fcfed04c5096cefcc9a01eb14407"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.143/aethyme-v0.8.143-x86_64-apple-darwin.tar.gz"
      sha256 "39053e5d362fd428531fd01aae6e1add98809b8b499e4c48b98f97086f9fd94f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.143/aethyme-v0.8.143-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a94115667f7c0f0e724d48ec97319ff3b560a6bd167ec9d1271c852a4c8d2b2"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.143/aethyme-v0.8.143-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "241984194ffac9f3f97a72c175ddb8997c67dfd5ab88550852973b56b7c20f58"
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
