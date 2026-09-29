# frozen_string_literal: true

# The paired Aethyme router and engine daemon.
class Aethyme < Formula
  desc "Local-first flight control for concurrent AI coding agents"
  homepage "https://github.com/schiste/Aethyme"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.9/aethyme-v0.8.9-aarch64-apple-darwin.tar.gz"
      sha256 "42d5f9fd5fab02fac9fc313efe5bac63402440da87942c83280134276b11f0bf"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.9/aethyme-v0.8.9-x86_64-apple-darwin.tar.gz"
      sha256 "453658893a61f62c4f644ce7d95c316ca196e90138882263fac8572ac74de280"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.9/aethyme-v0.8.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24d57950783e1f4cf82050efdb349e370cc57811c8340317219185e6bae8c9bb"
    end

    on_intel do
      url "https://github.com/schiste/Aethyme/releases/download/v0.8.9/aethyme-v0.8.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d1adcf3bb728410c89593511b3e69d86125658a16339378fd9ed5927ab309340"
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
