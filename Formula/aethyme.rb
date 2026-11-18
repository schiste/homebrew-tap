# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.126/aethyme-v0.8.126-aarch64-apple-darwin.tar.gz"
      sha256 "3818a062e24d2936beaddab0df3b005e2a346df2f6599626df19dcc22d17d5a3"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.126/aethyme-v0.8.126-x86_64-apple-darwin.tar.gz"
      sha256 "3a288f29ebfdc14aa10f6c4b5551820c4ee74c6e5a8e07e0137a7832677d475d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.126/aethyme-v0.8.126-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd928e4c906132c029117c8c40ca59f0f377b07e2829582bec7f5a066d96ae0b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.126/aethyme-v0.8.126-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c459fa0c60a0333028fc02e8daea9695e28e50613b00d190e035c34f18b8d4fd"
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
