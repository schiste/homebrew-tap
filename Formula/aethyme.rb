# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.32/aethyme-v0.8.32-aarch64-apple-darwin.tar.gz"
      sha256 "0d86ed3bbe501e56744e7f79dcf7bc09f3511db581ac6a531c2ff09d08115866"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.32/aethyme-v0.8.32-x86_64-apple-darwin.tar.gz"
      sha256 "d82967df9823e10d36d2538b5b74fc35e9bad5b9101abc288399a3b7b83613d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.32/aethyme-v0.8.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17e63987b7de861e42b07e7cba555e5e42fcd45ddec19a9840d431f419652755"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.32/aethyme-v0.8.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fda18fce0541de10dd1e2ea8c668686ae3f1321c936d61986413650641dff949"
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
