class Mdc < Formula
  desc "Simple markdown viewer built with Tauri"
  homepage "https://github.com/zoetin45/mdc"
  url "https://github.com/zoetin45/mdc/releases/download/v0.1.0/mdc-aarch64-apple-darwin"
  sha256 "081675f3268611b78cf4e4994fc40e17b527ee14f972d73ef775674cc9c20e2e"
  license "MIT"

  def install
    system "pnpm", "install"
    system "pnpm", "build"
    cd "src-tauri" do
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end

  test do
    system "#{bin}/mdc", "--help"
  end
end
