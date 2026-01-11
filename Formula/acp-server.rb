class AcpServer < Formula
  desc "Agent Credential Proxy - secure credential management for AI agents"
  homepage "https://github.com/mikekelly/acp"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mikekelly/acp/releases/download/v0.1.1/acp-darwin-arm64.tar.gz"
      sha256 "afb4b351e01b65a5b3a3994ce8fe4cbc878caef84304447d187d85b54ee77ec0"
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
    # Use file-based storage instead of Keychain to survive upgrades
    environment_variables ACP_DATA_DIR: var/"acp"
  end

  test do
    system "#{bin}/acp-server", "--version"
  end
end
