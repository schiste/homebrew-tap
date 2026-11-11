# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.69/aethyme-v0.8.69-aarch64-apple-darwin.tar.gz"
      sha256 "172efe9de0c100dedb8f4f52f8ea4da32ead54df406e1d5cf8b83ad378a92b50"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.69/aethyme-v0.8.69-x86_64-apple-darwin.tar.gz"
      sha256 "7eefa00589eac2203eec0d690dd0bb8506f80ccc429e2d6b5cff4eb001a50999"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.69/aethyme-v0.8.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7066e600ab438c8103d45ab29b3ba1e2e561b9dc8f350974c826b2527835968b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.69/aethyme-v0.8.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a261265fd6b9608be95ac90319750d1fa78e298858f38f97a631eb252ffdb680"
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
