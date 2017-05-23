class Hugor < Formula
  desc "Multimedia interpreter for Hugo adventure games"
  homepage "https://github.com/realnc/hugor"
  url "https://github.com/realnc/hugor/releases/download/1.0/hugor-1.0-src.tar.bz2"
  sha256 "8106bcdf905d7e548d2964a09af9f684535ba41c917b55cecc271c47a30037e6"

  depends_on "pkg-config" => :build
  depends_on "qt"
  depends_on "sdl"
  depends_on "sdl_mixer" => ["with-libmikmod", "with-smpeg"]

  def install
    system "qmake", "SOUND=sdl", "DEFINES+=NO_STATIC_TEXTCODEC_PLUGINS"
    system "make"
    prefix.install "Hugor.app"
    bin.write_exec_script "#{prefix}/Hugor.app/Contents/MacOS/Hugor"
  end

  test do
    File.executable? "#{prefix}/Hugor.app/Contents/MacOS/Hugor"
  end
end
