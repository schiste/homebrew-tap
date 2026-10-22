# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.29/aethyme-v0.8.29-aarch64-apple-darwin.tar.gz"
      sha256 "9bdf5daf6fd77b10af888bfa46fdbe66dbc8c6f8147706684fbe3ab8e5933b68"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.29/aethyme-v0.8.29-x86_64-apple-darwin.tar.gz"
      sha256 "2773d4277dee80dc48bb26ee1cab6cfc05c527cf900e8362318d8278fe430aa2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.29/aethyme-v0.8.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63e3f535aa9fefd6116b692720fc41c3830b593b0f742ee346f6bc5c24e10e0e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.29/aethyme-v0.8.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "823e2f69d1ef821fefd1e9754f81e0188fd9c0c09e49a29873ca4e97131641ed"
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
