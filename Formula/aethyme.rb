# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.99/aethyme-v0.8.99-aarch64-apple-darwin.tar.gz"
      sha256 "92ef363f5eaf6f7e4a83a2b2fd884fea29acad6bcead3e87d82d4ba493f48fc6"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.99/aethyme-v0.8.99-x86_64-apple-darwin.tar.gz"
      sha256 "7336a9efa13905247c6a23f972d183ff815fcf1d4d4f494e9dc04ae6e748430c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.99/aethyme-v0.8.99-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "542090bbc88339bbcfaaf6658e128a9ff084ffc62cc272ca365298865e6b2bcf"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.99/aethyme-v0.8.99-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6fe5a3c8248a8bb7f3615874e58f5e4ea054c198b1be0a6fe871687871989d98"
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
