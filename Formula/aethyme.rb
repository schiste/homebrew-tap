# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.139/aethyme-v0.8.139-aarch64-apple-darwin.tar.gz"
      sha256 "493cc2ae811bd74138eb802698e632eb42ffea07931beafa96e3f5eecbf96d92"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.139/aethyme-v0.8.139-x86_64-apple-darwin.tar.gz"
      sha256 "a48689b9cb88ccc9eb6aa647e6b687f2ea994bed23dfc442fbafcd3e1b309c2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.139/aethyme-v0.8.139-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2a823db41155c8b8ab04cb78aa91707c9ac597ead4fa1305f225809f082cb67"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.139/aethyme-v0.8.139-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25a94bb60e8f37e0229e31d8c1e007ad3b8e7d8c64da783203333f90da0c860e"
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
