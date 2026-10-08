class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.4.0"
  license "MIT"
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.4.0/ahvm-client-0.4.0-darwin-aarch64.tar.gz"
      sha256 "6db99f4fca2d4f9379475264b4b5373a16ab6bed422bad675000d876f9814abc"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.4.0/ahvm-client-0.4.0-linux-x86_64.tar.gz"
      sha256 "86d606f4c49edce8465ee81242cd482bcb5899a2451d00889f0fb7bbd2a060bc"
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
