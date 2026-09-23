# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.1/aethyme-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "781948eb0eecfe067a2e423afdf3af3f33a58c227ac5d9d23ef81b8936c804d8"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.1/aethyme-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "8176fac554032307333a5202647181245f49c49ca72ba5f87aab870b97ab682e"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.1/aethyme-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59ec4c63981bbf85eadb91c48ccdfb83173a469778ce7dabf749e87de3802638"
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
