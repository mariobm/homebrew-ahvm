class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.4.1"
  license "MIT"
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.4.1/ahvm-client-0.4.1-darwin-aarch64.tar.gz"
      sha256 "6fa57ba9c716690025f7405c3f1ed74bf1a731ac604226a6f60937ce40fd1772"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.4.1/ahvm-client-0.4.1-linux-x86_64.tar.gz"
      sha256 "420b47c1343f4a5e1f33ba1be64b91a3d96979e8e1c9151d2c9d8bf480ab1a23"
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
