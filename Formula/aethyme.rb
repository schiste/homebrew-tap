# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.96/aethyme-v0.8.96-aarch64-apple-darwin.tar.gz"
      sha256 "37cf819f81adab5c1bb796dd1a891792894597868a9f582a96fbc8580aa36bfd"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.96/aethyme-v0.8.96-x86_64-apple-darwin.tar.gz"
      sha256 "150c7a94180525dba71081701fa32252ad53d761da1b3514cbc9608eb8664824"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.96/aethyme-v0.8.96-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57e4c218dca5e722803f89334ec78310eaf29dc4a8745c2b07020261da5e922a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.96/aethyme-v0.8.96-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e2501ae561c5c209631614d4ae3f1748952df9f2a839f3f9376716ccddf66da"
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
