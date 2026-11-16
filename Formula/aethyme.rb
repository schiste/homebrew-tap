# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.112/aethyme-v0.8.112-aarch64-apple-darwin.tar.gz"
      sha256 "9937b40b8a0d7867719549612ac854d20ddcd154cd08027721b1b7261c2dc4ad"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.112/aethyme-v0.8.112-x86_64-apple-darwin.tar.gz"
      sha256 "92535bf8859b35d8998e566f130f4e0b7dc0e49585082da5b62c467c6a5c6f2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.112/aethyme-v0.8.112-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c88bcc6e7747fc3fb4080ff46a98dbfcc6258da6ec1da69b2bc024e8ebbb45ce"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.112/aethyme-v0.8.112-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0aa8d1db6be55b740127dfb0b552e232df4c4f569bf76b98ded94b4929c0617c"
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
