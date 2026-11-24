# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.169/aethyme-v0.8.169-aarch64-apple-darwin.tar.gz"
      sha256 "7cae2f1b255b840a73d75323ccae32d8abc0a7945b75f2e34961a25fab476b52"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.169/aethyme-v0.8.169-x86_64-apple-darwin.tar.gz"
      sha256 "924ce2b437bfda904166cdce27ef2aacf09fa45534e590cc5743c59a19c0dfdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.169/aethyme-v0.8.169-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "483ebd68a48465100691234ba74b284ebcd92d27ee196db1841d862f7ad4d3dd"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.169/aethyme-v0.8.169-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d1170733f0d20574c8f9f74d2d7456d872b2073572a0401230d50dce67fc547"
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
