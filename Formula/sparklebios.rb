# Kept up to date automatically by .github/workflows/update-formula.yml,
# which polls the sparklebios releases on a schedule and rewrites the
# version and sha256 lines below when a new one appears. Edit the
# surrounding structure here freely (dependencies, caveats, the test
# block), but a hand edit to a version or sha256 line will just be
# overwritten on the next run.
class Sparklebios < Formula
  desc "A 1995 POST screen for your terminal that is secretly a health check"
  homepage "https://github.com/reactivepixels/sparklebios"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/reactivepixels/sparklebios/releases/download/v#{version}/bios-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "de6ca24196fa79c18168f5da6b98f7839b6894b6b4850d095c1a65f19e2544c5"
    end
    on_intel do
      url "https://github.com/reactivepixels/sparklebios/releases/download/v#{version}/bios-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f45cd6acc39a63507cdbb8a0f51b336a446da55c2f4d7ceb43afa378ec7fd7df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/reactivepixels/sparklebios/releases/download/v#{version}/bios-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad3b8f8926f5d6b88c4892e063fb7f462d39046d8272c682ff9107767145a836"
    end
    on_intel do
      url "https://github.com/reactivepixels/sparklebios/releases/download/v#{version}/bios-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1fb079cce0cc51630a41797525ffe7ee14ca262b658bf08d1d2c1e563a7c19a"
    end
  end

  def install
    bin.install "bios"
  end

  test do
    system "#{bin}/bios", "--version"
  end
end
