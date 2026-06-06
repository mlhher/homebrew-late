class Late < Formula
  desc "High-leverage AI agent orchestrator with ephemeral subagents"
  homepage "https://github.com/mlhher/late-cli"
  # version and sha256 values are auto-updated by CI on each release
  version "1.2.7"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-darwin-arm64"
      sha256 "4ce0fd651574de30ec7a587dacc1889eab9d97a9c8de697c485482e24c0f02c5"
    else
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-darwin-amd64"
      sha256 "1508a5b078d03e9926b18b818417a85b41170bba3915682efc7b77bc0d91739b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-linux-arm64"
      sha256 "530085f433f26334d4462ab5d765264dc38a9fdfc0f3adb1cf66b8302850c9fd"
    else
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-linux-amd64"
      sha256 "9091bcd3d0f99ee55117d4d317be02571f99b46dbc1dc781e2307603a9f25dc0"
    end
  end

  def install
    bin.install Dir.glob("late-*").first => "late"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/late --version")
  end
end
