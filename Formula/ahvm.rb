class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.3.0"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.0/ahvm-client-0.3.0-darwin-aarch64.tar.gz"
      sha256 "5dc95f97791958e7811a0df006b0a12d86c77e175d63c6c06663641828f4d19c"
    end
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.0/ahvm-client-0.3.0-darwin-x86_64.tar.gz"
      sha256 "3761e1047a7b20f7528d7132345682bf7025b810263257e9eb6ecf0c6364d95e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.0/ahvm-client-0.3.0-linux-x86_64.tar.gz"
      sha256 "e22823424cfcaee649bcf9e877011b8f580e3b7f5de1ace4733b08be664fa5b2"
    end
  end

  def install
    if File.exist?("ahvm")
      bin.install "ahvm"
      bin.install "ahvm-desktop" if File.exist?("ahvm-desktop")
      pkgshare.install Dir["ahvm-desktop-*"] unless Dir["ahvm-desktop-*"].empty?
    else
      bin.install Dir["ahvm-*"][0] => "ahvm"
    end
    chmod 0755, bin/"ahvm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ahvm --version")
  end
end
