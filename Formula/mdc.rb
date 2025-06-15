class Mdc < Formula
  desc "mdc - Just another markdown viewer"
  homepage "https://github.com/zoetin45/mdc"
  version "0.1.10"
  url "https://github.com/zoetin45/mdc/releases/download/v0.1.10/mdc_0.1.10_universal.dmg"
  sha256 "efda979caa4e74477f53f543b7eac64a7fc8e9394543351f814332ef66614567"

  def install
    # DMGをマウント
    mountpoint = "/Volumes/mdc"
    system "hdiutil", "attach", "-quiet", "-mountpoint", mountpoint, cached_download

    begin
      # アプリをインストール
      app = Pathname.new("#{mountpoint}/mdc.app")
      prefix.install app

      # バイナリへのシンボリックリンクを作成
      bin.install_symlink prefix/"mdc.app/Contents/MacOS/mdc"
    ensure
      # DMGをアンマウント
      system "hdiutil", "detach", "-quiet", mountpoint
    end
  end

  test do
    system "#{bin}/mdc", "--version"
  end
end
