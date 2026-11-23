# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.162/aethyme-v0.8.162-aarch64-apple-darwin.tar.gz"
      sha256 "c197bd5bac0ec19d261ad75c4f6a356209750adf94202c87f73422948dd6ae40"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.162/aethyme-v0.8.162-x86_64-apple-darwin.tar.gz"
      sha256 "06047be48f89c2b1748a43ba6b726c78fecae6c369ee3f316f4a84176d7968a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.162/aethyme-v0.8.162-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca482bd4c54838621b2929c3e7be97e3fd85b57443394ea8bc9a139fd88ba481"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.162/aethyme-v0.8.162-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e50cb5567461ddd8d10a392fc840f71decab0154dc99b91a5467e365fa24c2a"
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
