# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.5/aethyme-v0.7.5-aarch64-apple-darwin.tar.gz"
      sha256 "4aa48dfcd350f0a4276c0441e178e8d283be894cb81805d0fcaf19c675f44b41"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.5/aethyme-v0.7.5-x86_64-apple-darwin.tar.gz"
      sha256 "cddab40d02d2059c2dcb5ed4b18426c723a3bc8135245c84bd1d21f1348156ee"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.7.5/aethyme-v0.7.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a2443ddb17665e5b536aa626cb720f3e33fb4ce6cc467a058f52c44d849a90b"
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
