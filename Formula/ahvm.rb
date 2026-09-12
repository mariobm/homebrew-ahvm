class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.2.5"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.5/ahvm-client-0.2.5-darwin-aarch64.tar.gz"
      sha256 "a49e54010523e0f4f271eb5452effc3f8344cfbdc35cde4e4fd13b689ca36ed7"
    end
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.5/ahvm-client-0.2.5-darwin-x86_64.tar.gz"
      sha256 "25070be271a0e505c7e69458fd2d146899460e059df527c0c9845664ecc55df9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.5/ahvm-client-0.2.5-linux-x86_64.tar.gz"
      sha256 "d1c0a52a5c73264508ae5590b127c25169758ade6cc9a3c5c3d46c038a9b7aac"
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
