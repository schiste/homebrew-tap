# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.14/aethyme-v0.7.14-aarch64-apple-darwin.tar.gz"
      sha256 "f5eb58ba8cff8029e13eef110289bff53c72f9609b170dfdccffbe9fd2ffedf9"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.14/aethyme-v0.7.14-x86_64-apple-darwin.tar.gz"
      sha256 "56fe8a1d24ee6eb5462eed466620391486af2002c4e540f0a009bbdce99d4e81"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.14/aethyme-v0.7.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1750aabebc1fdb07fabe96d2496800291d8bc4f82fda1672df851def5f7d971"
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
