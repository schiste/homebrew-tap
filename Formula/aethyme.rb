# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.6.0/aethyme-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "48dcc756286d1ba55b8c3a7ad84d9682fcbbe3483db39724c421f37997e4deec"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.6.0/aethyme-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "ce217bc4336c9f515c1b707873bf4aefe4c60e741f58d990e329bb89c79a4a6c"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.6.0/aethyme-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a64866e6cd1b295efe35ccad1e5d0718c6d0bf5b880b8c0d9a80373c42ce404"
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
