# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.13/aethyme-v0.7.13-aarch64-apple-darwin.tar.gz"
      sha256 "e7416a441091d95d09713ebe42e32186e6b4c2eb6643b5941280cf65289dc699"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.13/aethyme-v0.7.13-x86_64-apple-darwin.tar.gz"
      sha256 "5946701831417106d055585367a99ffea303cdd0165cd32a32457aa44f3ae607"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.13/aethyme-v0.7.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ead14228ecf839d12ace290eec666b2789076470cb678bf8a0ad29fa387dc49f"
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
