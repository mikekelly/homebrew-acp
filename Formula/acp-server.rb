class AcpServer < Formula
  desc "Agent Credential Proxy - secure credential management for AI agents"
  homepage "https://github.com/mikekelly/acp"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mikekelly/acp/releases/download/v0.3.0/acp-darwin-arm64.tar.gz"
      sha256 "b5751e55b2104913c03e9bb034763edfb6b9722be2627ddd893687656adc4e64"
    else
      # x86_64 binary not yet available
      odie "Intel Mac binary not yet available. Please build from source."
    end
  end

  def install
    bin.install "acp"
    bin.install "acp-server"
  end

  service do
    run [opt_bin/"acp-server"]
    keep_alive true
    log_path var/"log/acp-server.log"
    error_log_path var/"log/acp-server.err"
  end

  test do
    system "#{bin}/acp-server", "--version"
  end
end
