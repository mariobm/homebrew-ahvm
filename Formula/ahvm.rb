class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.3.6"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.6/ahvm-client-0.3.6-darwin-aarch64.tar.gz"
      sha256 "4ac67326979ec29b4ed105bde6d0d3fb3b671591c3b8821fb2f382d9ebbe6620"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.6/ahvm-client-0.3.6-linux-x86_64.tar.gz"
      sha256 "5efd1acc4e317811e8f578e3598edc1fefc0c31f186097bc204c818d54119402"
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
