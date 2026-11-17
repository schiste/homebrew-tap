# frozen_string_literal: true

class Aexeo < Formula
  desc "SEO and GEO site auditing CLI"
  homepage "https://github.com/schiste/Aexeo"
  version "0.0.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aexeo/releases/download/v0.0.24/aexeo-cli-darwin-arm64"
      sha256 "0a275056ced50676e5eefde4f54ba21c40d2f81abd8619965a6088669a3aa7a6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schiste/Aexeo/releases/download/v0.0.24/aexeo-cli-linux-x86_64"
      sha256 "a5230654d412dc08feffc5e145bed7eaf57b1d4a3c95b7a0db4a04c90180b866"
    end
  end

  def install
    binary = if OS.mac? && Hardware::CPU.arm?
      "aexeo-cli-darwin-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      "aexeo-cli-linux-x86_64"
    else
      odie "Aexeo prebuilt binaries are available for Apple Silicon macOS and Intel x86_64 Linux"
    end

    bin.install binary => "aexeo-cli"
    chmod 0755, bin/"aexeo-cli"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/aexeo-cli --help")
  end
end
