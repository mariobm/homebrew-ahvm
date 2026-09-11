class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.2.4"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.4/ahvm-client-0.2.4-darwin-aarch64.tar.gz"
      sha256 "5a9594c7d0a3baa2225f70532abe0b667d433442dd365401576b86433d78e307"
    end
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.4/ahvm-client-0.2.4-darwin-x86_64.tar.gz"
      sha256 "695809b195ca15bd29c3fb873459e93f39a847aaccb5d3dffd38abcc7c6efe84"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.4/ahvm-client-0.2.4-linux-x86_64.tar.gz"
      sha256 "a29c0130bff9a6b8fbaa6f3cb6ea919fb0a7e26433023a997701d341c30cd453"
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
