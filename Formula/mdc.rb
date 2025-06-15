class Mdc < Formula
  desc "MDC - Markdown Converter"
  homepage "https://github.com/zoetin45/mdc"
  version "0.1.10"
  url "https://github.com/zoetin45/mdc/releases/download/v0.1.10/mdc_0.1.10_universal.dmg"
  sha256 "efda979caa4e74477f53f543b7eac64a7fc8e9394543351f814332ef66614567"

  def install
    system "hdiutil", "attach", cached_download
    volumes = Dir["/Volumes/mdc*"]
    mountpoint = volumes.first

    begin
      app_path = "#{mountpoint}/mdc.app"
      cp_r app_path, prefix
      bin.install_symlink prefix/"mdc.app/Contents/MacOS/mdc"
    ensure
      system "hdiutil", "detach", mountpoint
    end
  end

  test do
    system "#{bin}/mdc", "--version"
  end
end
