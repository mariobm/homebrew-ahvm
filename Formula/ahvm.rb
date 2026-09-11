class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.2.3"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.3/ahvm-client-0.2.3-darwin-aarch64.tar.gz"
      sha256 "5302dbed726fd0d1994be6f250a83e5e50b1bb3422e977abec67352713532b56"
    end
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.3/ahvm-client-0.2.3-darwin-x86_64.tar.gz"
      sha256 "995b512b68ac6fd4518e65bdbdaa771c21f95a456aaafb6c9a5d620138ca7ec2"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.3/ahvm-client-0.2.3-linux-x86_64.tar.gz"
      sha256 "d850ef9e0cab81455e619021c4be898c50060759da60b747b07ffffe5e10694a"
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
