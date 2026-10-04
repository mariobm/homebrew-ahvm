class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.3.14"
  license "MIT"
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.14/ahvm-client-0.3.14-darwin-aarch64.tar.gz"
      sha256 "9d016d83af02dbdedede542595f708c8fa7c152c372ead4f7612ed59bf796eb1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.14/ahvm-client-0.3.14-linux-x86_64.tar.gz"
      sha256 "799a8e19db87889a915e918657de644d2a8a4fec09db7530fccf00c6d0ce8eca"
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
