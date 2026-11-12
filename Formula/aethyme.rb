# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.78/aethyme-v0.8.78-aarch64-apple-darwin.tar.gz"
      sha256 "b027a17df27f1e69ade598bf8ed8d9b45edf86d0017a827613e7da77cd62d36c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.78/aethyme-v0.8.78-x86_64-apple-darwin.tar.gz"
      sha256 "691f5f8586b8ba6e20081607bcda22cfb033f01c97ec741872d03345d860f68c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.78/aethyme-v0.8.78-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60da177ef89872dcc4034ae0371d15f62442ff0ca7e38ddc02a99b0590d283c5"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.78/aethyme-v0.8.78-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "938374c3513ec2d849c3af7c723cf78df7353a94aa3a2ece726333d84e2a2873"
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
