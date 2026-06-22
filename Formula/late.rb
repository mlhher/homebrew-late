class Late < Formula
  desc "High-leverage AI agent orchestrator with ephemeral subagents"
  homepage "https://github.com/mlhher/late-cli"
  # version and sha256 values are auto-updated by CI on each release
  version "1.3.1"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-darwin-arm64"
      sha256 "b25e0f3e4cf47af404233f0fc176b3ce098733bde8587ecd3ffd2064655d5796"
    else
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-darwin-amd64"
      sha256 "379b8882e2d19946af6cd843ba37da7c14122fd264eee18317460ebbd3cfd797"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-linux-arm64"
      sha256 "72594bd86162c9003d7b119c59f7033ad6854c9961328f6f71d5d3128aa1b346"
    else
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-linux-amd64"
      sha256 "182a62ff02df5fedd25502a9ad3c0c88bf318bec463352031daa6e63e91abe28"
    end
  end

  def install
    bin.install Dir.glob("late-*").first => "late"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/late --version")
  end
end
