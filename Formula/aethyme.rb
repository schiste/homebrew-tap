# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.131/aethyme-v0.8.131-aarch64-apple-darwin.tar.gz"
      sha256 "429f18eab571f2a66407afdf9b4e5b50baa61a0c1171fdf44e3d442c89e9a5f1"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.131/aethyme-v0.8.131-x86_64-apple-darwin.tar.gz"
      sha256 "dc83f727079ece405f9f6306ce575a4c72709e5cf5bbda965e34afa850133557"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.131/aethyme-v0.8.131-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "406cfa44f479b0310d068e7d054367c43545fa980f115380a1809e6cdc72711b"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.131/aethyme-v0.8.131-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "700938ce9211a272427e952fa1dfbfc56094580566b02fdf939376d94d83b51b"
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
