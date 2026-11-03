# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.55/aethyme-v0.8.55-aarch64-apple-darwin.tar.gz"
      sha256 "728b4c9eb84ecca6bfa679a478748c6779d8197cda5d39547da051b7d249d703"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.55/aethyme-v0.8.55-x86_64-apple-darwin.tar.gz"
      sha256 "9ffaf55279583cdfea8b76c63117d897c56cfcf7737dbc1c687d6d3d5921f105"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.55/aethyme-v0.8.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae4313ba5e54b9700b923d989ecc9b179e72d3920cfedf69e1acc4dead7fcb52"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.55/aethyme-v0.8.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43061ad6ec46839c083e3a64a9dc863a19571e2ce79bfa4e245371c03208c09b"
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
