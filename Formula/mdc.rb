class Mdc < Formula
  desc "MDC - Markdown Converter"
  homepage "https://github.com/zoetin45/mdc"
  version "0.2.0"
  url "https://github.com/zoetin45/mdc/releases/download/v0.2.0/mdc_0.2.0_universal.dmg"
  sha256 "7da459c823a52fc5d6333d9a4429e52bd31ea116ece9427567c6bc5c8f65c5b5"

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
