class Ahvm < Formula
  desc "Persistent Linux microVMs for coding agents"
  homepage "https://ahvm.app"
  version "0.2.1"
  license "LicenseRef-AHVM-Community-1.0"
  on_macos do
    on_arm do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.1/ahvm-0.2.1-darwin-aarch64.gz"
      sha256 "bfe6e2cdbe48a82a78037a5df756ad6a3012e49b55759740c6c728f5c39f3be3"
    end
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.1/ahvm-0.2.1-darwin-x86_64.gz"
      sha256 "2560d96c8c85d97ada4741d26c659502027615b0cf4a6de5dba0e97c24bf289c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/mariobm/agent-house/releases/download/v0.2.1/ahvm-0.2.1-linux-x86_64.gz"
      sha256 "2a78663b4000a4a76889078fe26e300f33c3ad90d42421c607d778aa7cbdfa31"
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
