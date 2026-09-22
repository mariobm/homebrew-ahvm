class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.3.8"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.8/ahvm-client-0.3.8-darwin-aarch64.tar.gz"
      sha256 "900d9abe4ee7c5997807ed9221fb67a6ac203d826fdd2ae8b076f2f73994782b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.8/ahvm-client-0.3.8-linux-x86_64.tar.gz"
      sha256 "39dfa5b5cb63d6a07863fa2bc4baabdc9316682dbaeebfce55939f7dff157200"
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
