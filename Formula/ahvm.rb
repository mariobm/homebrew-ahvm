class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.5.0"
  license "MIT"
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.5.0/ahvm-client-0.5.0-darwin-aarch64.tar.gz"
      sha256 "4f87bb22f28ee82f597da8765e5d20a6e079caac825767b4280bc0518e72569c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.5.0/ahvm-client-0.5.0-linux-x86_64.tar.gz"
      sha256 "2c0bb769e398e70a120a1a669341055eb85bbfc5da822c07ae04c03b13023989"
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
