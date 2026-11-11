# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.68/aethyme-v0.8.68-aarch64-apple-darwin.tar.gz"
      sha256 "345742b1140a9a9a4b738361633d966414b680bf61f2ccb5f5d98242d98010cf"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.68/aethyme-v0.8.68-x86_64-apple-darwin.tar.gz"
      sha256 "976290c0e5dd72223e62101ff093a985f4d53b0fbf0a47f49ca139616fb379b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.68/aethyme-v0.8.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2b6b9f5ab0a34faed6f7030a2221187526ad031fa5f24e6d272af1e2318a40d"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.68/aethyme-v0.8.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "635318325a5ce49e60626b8250a041da34513b449b14a05449ae9e7aacaa01f0"
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
