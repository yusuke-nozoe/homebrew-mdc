class Mdc < Formula
  desc "Simple markdown viewer built with Tauri"
  homepage "https://github.com/yusuke-nozoe/mdc"
  url "https://github.com/yusuke-nozoe/mdc/archive/v0.1.0.tar.gz"
  sha256 "YOUR_SHA256_HERE"
  license "MIT"

  depends_on "rust" => :build
  depends_on "node" => :build
  depends_on "pnpm" => :build

  def install
    # フロントエンドのビルド
    system "pnpm", "install"
    system "pnpm", "build"

    # Tauriアプリのビルド
    system "pnpm", "tauri", "build"

    # バイナリをインストール
    bin.install "src-tauri/target/release/mdc"
  end

  test do
    system "#{bin}/mdc", "--help"
  end
end
