class Late < Formula
  desc "High-leverage AI agent orchestrator with ephemeral subagents"
  homepage "https://github.com/mlhher/late-cli"
  # version and sha256 values are auto-updated by CI on each release
  version "1.2.4"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-darwin-arm64"
      sha256 "f993cd65c80eaa0817882c80dd5fa269b1edc4ce155b81e33d0586df98b5bf7f"
    else
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-darwin-amd64"
      sha256 "72564f4311c25ea991a98ef4e27ad78696a824f55490b0d999b2b2f1a5a64ad3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-linux-arm64"
      sha256 "e508f2bf23db989d11196b297b664d8bcd563158c8ac8036b1622cd4a7ed6fa6"
    else
      url "https://github.com/mlhher/late-cli/releases/download/v#{version}/late-linux-amd64"
      sha256 "24fc41c6d687d71606f743fa0ee7c13d51cddb7481f8127945fa9d31042f7ef9"
    end
  end

  def install
    bin.install Dir.glob("late-*").first => "late"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/late --version")
  end
end
