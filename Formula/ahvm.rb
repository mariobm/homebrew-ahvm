class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.2.0"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.0/ahvm-0.2.0-darwin-aarch64.gz"
      sha256 "586063d44876e1c4fe44c9b2bda6648cac466ba357d13275f8d999a0c942f1e3"
    end
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.0/ahvm-0.2.0-darwin-x86_64.gz"
      sha256 "f43e3e6495e101d2fc7d3fbd80843831e25d04d89b47a5f02614be6f4caccfa2"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.0/ahvm-0.2.0-linux-x86_64.gz"
      sha256 "eebc424a327e06c30393707696fb31f19f2ac3723dd9281a9f9684ecbe46d15f"
    end
  end

  def install
    bin.install Dir["ahvm-*"][0] => "ahvm"
    chmod 0755, bin/"ahvm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ahvm --version")
  end
end
