class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.3.16"
  license "MIT"
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.16/ahvm-client-0.3.16-darwin-aarch64.tar.gz"
      sha256 "ce96a8f5a2493ecc1da6dbf1a3e7af3022a81f6ae4ca62acdced1837465f1470"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.16/ahvm-client-0.3.16-linux-x86_64.tar.gz"
      sha256 "3f0d493a25fa870f15aea2d08ba8bdf3f8deee7bfc8c1561b7f9bf4fe529309e"
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
