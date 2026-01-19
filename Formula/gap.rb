class Gap < Formula
  desc "Gated Agent Proxy - secure credential management for AI agents"
  homepage "https://github.com/mikekelly/gap"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mikekelly/gap/releases/download/v0.4.0/gap-darwin-arm64.tar.gz"
      sha256 "121d97ab276a0e5808fb25d5a933d79c5e8f693fb1f216a6a48abd1e5fa67ca4"
    else
      # x86_64 binary not yet available
      odie "Intel Mac binary not yet available. Please build from source."
    end
  end

  def install
    bin.install "gap"
    bin.install "gap-server"
    # Alias for oh-my-zsh users who have 'gap' aliased to 'git apply'
    bin.install_symlink "gap" => "gap-cli"
  end

  service do
    run [opt_bin/"gap-server"]
    keep_alive true
    log_path var/"log/gap-server.log"
    error_log_path var/"log/gap-server.err"
  end

  test do
    system "#{bin}/gap-server", "--version"
  end
end
