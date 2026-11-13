# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.90/aethyme-v0.8.90-aarch64-apple-darwin.tar.gz"
      sha256 "c98dbefd504350c5661d534644f86f907f55177bd2cca8303865c7794a40ab62"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.90/aethyme-v0.8.90-x86_64-apple-darwin.tar.gz"
      sha256 "2015ad1eaff44a60bc9088b41c37106b0533da1b59d791c46e643c40bab00c0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.90/aethyme-v0.8.90-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "628f6d05cb22d7f9397acde41d034abcd5d560c1b51d938cd1acb6434764b6fa"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.90/aethyme-v0.8.90-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cedf5668d9b2092244ff3136dcc22b1a3bb175ae7a05b3830f9ff33975afbe1"
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
