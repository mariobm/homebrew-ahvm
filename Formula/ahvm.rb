class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.2.2"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.2/ahvm-client-0.2.2-darwin-aarch64.tar.gz"
      sha256 "ffd6046bfc8c2ef7508ec56dbb366e70ad7ca934ab9963322fd38c7ebcbfe7f2"
    end
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.2/ahvm-client-0.2.2-darwin-x86_64.tar.gz"
      sha256 "a776b19465463282e2777b79ccada5269a1d5071a79cac46ab0e9e7d3d7f718b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.2/ahvm-client-0.2.2-linux-x86_64.tar.gz"
      sha256 "92431c1f6170356c3cee1fb5f8763e6ea887c0e5ee7125f01fb77ed075d75bd0"
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
