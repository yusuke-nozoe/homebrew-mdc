class Mdc < Formula
  desc "Simple markdown viewer built with Tauri"
  homepage "https://github.com/yusuke-nozoe/mdc"
  url "https://github.com/yusuke-nozoe/mdc/archive/v0.1.1.tar.gz"
  sha256 "00573ee769da9ff060346335d183be872bd4e9f5d8341a67a5a8f476b6eafbe9"
  license "MIT"

  depends_on "rust" => :build
  depends_on "node" => :build
  depends_on "pnpm" => :build

  def install
    # フロントエンドのビルド
    system "pnpm", "install"
    system "pnpm", "build"

    # バイナリのみビルド（DMG作成をスキップ）
    cd "src-tauri" do
      system "cargo", "build", "--release"
    end

    # バイナリをインストール
    bin.install "src-tauri/target/release/mdc"
  end

  test do
    system "#{bin}/mdc", "--help"
  end
end
