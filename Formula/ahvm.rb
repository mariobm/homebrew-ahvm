class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.3.11"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.11/ahvm-client-0.3.11-darwin-aarch64.tar.gz"
      sha256 "da9f6ceaeac2bd7580a9e38b1282b2a18853f316c93255ac555cd9b7074e8d77"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.11/ahvm-client-0.3.11-linux-x86_64.tar.gz"
      sha256 "23ab9ff4278a63ccc02b3b1cde273dfd4f4c732196c095a93c0440375b28694b"
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
