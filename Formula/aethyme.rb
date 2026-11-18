# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.125/aethyme-v0.8.125-aarch64-apple-darwin.tar.gz"
      sha256 "69f2eac883ecd24035a308bdc6dc0cc46e01f8e7fd8d490aca172f03d71b64fa"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.125/aethyme-v0.8.125-x86_64-apple-darwin.tar.gz"
      sha256 "043d88ad940adef895323340bea2e990f970df8976b45b3e9225bdb61bb096db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.125/aethyme-v0.8.125-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1409e083eefadd73d591615915cb8c5d7d85477898c3ba7cd901005bc7d12114"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.125/aethyme-v0.8.125-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4eab380edd2a65eceb17dd1c146655223d24acf1b4fbb00c48b9af75cd088a15"
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
