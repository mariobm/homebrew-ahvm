class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.2.7"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.7/ahvm-client-0.2.7-darwin-aarch64.tar.gz"
      sha256 "e7534458e40d15c043bc8b9a6622ef81935bf0fe343afbec7508bf2722a9cc1f"
    end
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.7/ahvm-client-0.2.7-darwin-x86_64.tar.gz"
      sha256 "281905c34e38f3144d4617efc2122738a86ce0d929701c8834b8afe50022af82"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.7/ahvm-client-0.2.7-linux-x86_64.tar.gz"
      sha256 "2f3b82acd5fcf960129171a9fcfa482833e26553d3de745c785283439257a02c"
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
