# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.17/aethyme-v0.7.17-aarch64-apple-darwin.tar.gz"
      sha256 "56f7ae12b8252644d3641c6ebd661a0d910fd49bdf72bc83bcaf03c9e246bcc1"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.17/aethyme-v0.7.17-x86_64-apple-darwin.tar.gz"
      sha256 "3baa9ea20456a5f9d61b7a7543c3785a81665b8bdc5e54bbc379d49ac67897d6"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.17/aethyme-v0.7.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e2ad6593415e015f5a974d4ff93dd7bb622f0ea08bd84620ebc68c87aae419e"
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
