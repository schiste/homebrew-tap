# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.2/aethyme-v0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "157c4435b8ee32c522eecc13f4dedbe417bf5be259cdf4f11d50a51b755f463e"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.2/aethyme-v0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "cfc9d16862533a9ace373e82eebd84b81f723f17979abb70c44bd87161e0a80a"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.2/aethyme-v0.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31f860ecc4d563735146105607b77e07de0a0c992d7433ef876b681e2bd70e99"
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
