class Mdc < Formula
  desc "Simple markdown viewer built with Tauri"
  homepage "https://github.com/yusuke-nozoe/mdc"
  url "https://github.com/yusuke-nozoe/mdc/releases/download/v0.1.1/mdc-aarch64-apple-darwin"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  def install
    bin.install "mdc-aarch64-apple-darwin" => "mdc"
  end

  test do
    system "#{bin}/mdc", "--help"
  end
end
