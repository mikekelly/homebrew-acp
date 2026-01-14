class Tsk < Formula
  desc "Minimal task tracker for AI agents - plain markdown files, no database"
  homepage "https://github.com/mikekelly/tsk"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mikekelly/tsk/releases/download/v0.6.3/tsk-macos-arm64"
      sha256 "PLACEHOLDER_MACOS_SHA256"
    end
    on_intel do
      odie "Intel Mac binaries not available. Please build from source."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mikekelly/tsk/releases/download/v0.6.3/tsk-linux-x86_64"
      sha256 "PLACEHOLDER_LINUX_SHA256"
    end
  end

  def install
    binary_name = if OS.mac? && Hardware::CPU.arm?
      "tsk-macos-arm64"
    elsif OS.linux? && Hardware::CPU.intel?
      "tsk-linux-x86_64"
    end
    bin.install binary_name => "tsk" if binary_name
  end

  test do
    assert_match "tsk", shell_output("#{bin}/tsk --version")
  end
end
