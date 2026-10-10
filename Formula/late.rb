class Late < Formula
  desc "High-leverage AI agent orchestrator with ephemeral subagents"
  homepage "https://github.com/mlhher/late-cli"
  # version and sha256 values are auto-updated by CI on each release
  version "2.0.1"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-darwin-arm64"
      sha256 "fc887c759917cd1dd3d98548e78ebe92fe8b8b99f125e9739491183512fa97fb"
    else
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-darwin-amd64"
      sha256 "ce385e265f6fb951b932ce2ad556c78059761d84ba21ca7f98c09311f5fb23fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-linux-arm64"
      sha256 "94e393b60c962f3a85eff341882f5b3c40ef5b1fd6ed34e24ac6c248730fbc4a"
    else
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-linux-amd64"
      sha256 "d5b412a4df06fe5fc265628f2f26cbf06b2db76e101fe0492826d7c40d6b5ccf"
    end
  end

  def install
    bin.install Dir.glob("late-*").first => "late"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/late --version")
  end
end
