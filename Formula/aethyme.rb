# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.97/aethyme-v0.8.97-aarch64-apple-darwin.tar.gz"
      sha256 "31e9b86742064d8cc2c782368adde41fb7eb906e687a5009ae8aef972f7cc1e7"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.97/aethyme-v0.8.97-x86_64-apple-darwin.tar.gz"
      sha256 "a7f8484775ecc8617d3855dd3d6c070f530b890fda192a52dccfc0ba06573417"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.97/aethyme-v0.8.97-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0c571edc221eacbd752f3f1f17e3d6e7b9494b732eaaa6a65cf794bcaede19f"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.97/aethyme-v0.8.97-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "472156e818be3597027a2ca4335743647c0e4c33ecdefc98e2f4ac5c6063a95f"
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
