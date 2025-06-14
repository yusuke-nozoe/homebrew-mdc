class Mdc < Formula
  desc "Simple markdown viewer built with Tauri"
  homepage "https://github.com/zoetin45/mdc"
  url "https://github.com/zoetin45/mdc/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "081675f3268611b78cf4e4994fc40e17b527ee14f972d73ef775674cc9c20e2e"
  license "MIT"

  def install
    app = "mdc.app"
    prefix.install app
    bin.write_exec_script "#{prefix}/#{app}/Contents/MacOS/mdc"
  end

  def caveats
    <<~EOS
      mdc was installed to:
        #{prefix}/mdc.app
      
      To use the app, just type in CLI like:
        mdc pathname.md
    EOS
  end

  test do
    assert_predicate prefix/"mdc.app", :exist?
  end
end
