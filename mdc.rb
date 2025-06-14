class Mdc < Formula
  desc "Simple markdown viewer built with Tauri"
  homepage "https://github.com/yusuke-nozoe/mdc"
  url "https://github.com/yusuke-nozoe/mdc/releases/download/v0.1.1/mdc-aarch64-apple-darwin"
  sha256 "36ab4fe67e9b14a89cce42eb5230e9e20c821f7674a39fe3f1fcc33aa3d4d630"
  license "MIT"

  def install
    bin.install "mdc-aarch64-apple-darwin" => "mdc"
  end

  test do
    system "#{bin}/mdc", "--help"
  end
end
