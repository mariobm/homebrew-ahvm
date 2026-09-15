class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.3.5"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.5/ahvm-client-0.3.5-darwin-aarch64.tar.gz"
      sha256 "602ee2bf1501ad481d240ab8a557ff2fdb01055bc8bc9b51b522b1b5c64824c2"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.3.5/ahvm-client-0.3.5-linux-x86_64.tar.gz"
      sha256 "75b9156a5846f143395abe41efe6c75fdf8c600246ed2c8b228f2cebc42b74e4"
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
