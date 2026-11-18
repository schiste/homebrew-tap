# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.124/aethyme-v0.8.124-aarch64-apple-darwin.tar.gz"
      sha256 "79565c0f8ef949d1f1a4b96f7b6cd3337277c44ddbce8cec5d56d3c57d7d6a98"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.124/aethyme-v0.8.124-x86_64-apple-darwin.tar.gz"
      sha256 "49550b6bf9d73e9968d14bc6a23bc8dfbf8a8b27f664a479ed1ecb922a5b3dd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.124/aethyme-v0.8.124-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a3bff39f63bbe65d950be8f60200bbceebceb58a0bb1acc23799d677f2f2a71"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.124/aethyme-v0.8.124-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89c2532f67d2cba7e6f0fbabca64513a250a516e57f1ab10b05a48a5acc8bed3"
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
