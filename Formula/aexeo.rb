# frozen_string_literal: true

class Aexeo < Formula
  desc "SEO and GEO site auditing CLI"
  homepage "https://github.com/schiste/Aexeo"
  version "0.0.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aexeo/releases/download/v0.0.21/aexeo-cli-darwin-arm64"
      sha256 "46ee30e4b590f844039cbf9cb71a04d3d3fba1d0323fea2dbe53fd613dccd0e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schiste/Aexeo/releases/download/v0.0.21/aexeo-cli-linux-x86_64"
      sha256 "8638c8ddb8b8e1d08ac6dad471d3d5bd729907ffa19ea09eb8a62e536cc8db42"
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
