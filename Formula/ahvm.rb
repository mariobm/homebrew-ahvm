class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.3.1"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.1/ahvm-client-0.3.1-darwin-aarch64.tar.gz"
      sha256 "2f4c2ac177ccf51033d83942153cd2c46c189bd6821bf74e61c36b7adf26af9e"
    end
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.1/ahvm-client-0.3.1-darwin-x86_64.tar.gz"
      sha256 "483375bf748212248d9ce0ed95d0f37c953abc2283e525c66da3b26b4ef7c9d6"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.1/ahvm-client-0.3.1-linux-x86_64.tar.gz"
      sha256 "fff7ea39c0068aab031822e79a1670d1a33ff1738695eccedddbdf13496d0dba"
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
