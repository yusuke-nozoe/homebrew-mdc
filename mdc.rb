class Mdc < Formula
  desc "Simple markdown viewer built with Tauri"
  homepage "https://github.com/yusuke-nozoe/mdc"
  url "https://github.com/yusuke-nozoe/mdc/releases/download/v0.1.1/mdc-aarch64-apple-darwin"
  sha256 "00573ee769da9ff060346335d183be872bd4e9f5d8341a67a5a8f476b6eafbe9"
  license "MIT"

  def install
    bin.install "mdc-aarch64-apple-darwin" => "mdc"
  end

  test do
    system "#{bin}/mdc", "--help"
  end
end
