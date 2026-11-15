# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.98/aethyme-v0.8.98-aarch64-apple-darwin.tar.gz"
      sha256 "3540b494eb665cecef19f2b11b378a939de080255781be41ec59a860661e724a"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.98/aethyme-v0.8.98-x86_64-apple-darwin.tar.gz"
      sha256 "8ac3d242a622934b4122596f876c45b2a8a3ac815c3c00949aadc9dbc9cf03aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.98/aethyme-v0.8.98-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a59e21c48349c9b9ee28f1101f4f0c44e2c0adedbcb76d3308a540a1eb18c9c"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.98/aethyme-v0.8.98-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bfd1df7afe752650c7be09c7c848dbbb7271671b504bf0c29faeacf9fe875ea"
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
