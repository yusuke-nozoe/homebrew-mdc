class Mdc < Formula
  desc "Simple markdown viewer built with Tauri"
  homepage "https://github.com/yusuke-nozoe/mdc"
  url "https://github.com/yusuke-nozoe/mdc/archive/v0.1.0.tar.gz"
  sha256 "081675f3268611b78cf4e4994fc40e17b527ee14f972d73ef775674cc9c20e2e"
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
