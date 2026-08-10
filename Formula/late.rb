class Late < Formula
  desc "High-leverage AI agent orchestrator with ephemeral subagents"
  homepage "https://github.com/mlhher/late-cli"
  # version and sha256 values are auto-updated by CI on each release
  version "1.5.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-darwin-arm64"
      sha256 "16c19c3092cbc1338bc14bdaa6f0a9325f120a00132fb2b0b3620b4ec8207d81"
    else
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-darwin-amd64"
      sha256 "bf002192419cfb898d968ba1fe1963e8be575affcaaeebc5ca666be47e22f4ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-linux-arm64"
      sha256 "745c2b049ecb3238772ec06d9413fca4344d979d99c8d613a884d09448705175"
    else
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-linux-amd64"
      sha256 "6661f2146c2a612280d8b53fa72149f1d988b71278ea4d1ca954549fc4f809c2"
    end
  end

  def install
    bin.install Dir.glob("late-*").first => "late"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/late --version")
  end
end
