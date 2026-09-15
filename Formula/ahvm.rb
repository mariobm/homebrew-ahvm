class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.3.4"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.4/ahvm-client-0.3.4-darwin-aarch64.tar.gz"
      sha256 "3b956e4337aa6b5396771d12e348f30766fa02a30b3b149e2ab17443cb7a8977"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.4/ahvm-client-0.3.4-linux-x86_64.tar.gz"
      sha256 "c9ce9ec31e827eeeec51d712216d7e2c8625bee03b066076b03f2b7797654f66"
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
