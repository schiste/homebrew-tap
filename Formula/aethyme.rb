# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.91/aethyme-v0.8.91-aarch64-apple-darwin.tar.gz"
      sha256 "9c262c8d48c67dc70f5eca8230ad4e68a8cfe3f59af04a7cef96485f3ae620ae"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.91/aethyme-v0.8.91-x86_64-apple-darwin.tar.gz"
      sha256 "7bd2c5bee15190e8d9510176c558fa0efd4667aceb13bc866480c0767a441aba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.91/aethyme-v0.8.91-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0686d97fe7d84ec42a0d5ab7242e96dbc659d7e144c9414d6b0716150fa73db7"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.91/aethyme-v0.8.91-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efe73b86829a3d5f64a6ad7969327396788229e7fa5a7b7e7b1f2a44a4650ea0"
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
