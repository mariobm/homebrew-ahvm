class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.2.6"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.6/ahvm-client-0.2.6-darwin-aarch64.tar.gz"
      sha256 "43d969cf50ce617a0aede5a5e420e75170e9161ec275fefeac3e53d900160171"
    end
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.6/ahvm-client-0.2.6-darwin-x86_64.tar.gz"
      sha256 "22ade7cd09f22e2c79f1d851f4b26c979833a1a3d92f3e4270f9a207e052670f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.6/ahvm-client-0.2.6-linux-x86_64.tar.gz"
      sha256 "f47532ca033e0af2a5b3197b406523138bd422d983a5ea1cf92de0a761602d4f"
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
