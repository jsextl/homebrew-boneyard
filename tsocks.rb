class Tsocks < Formula
  # The original is http://tsocks.sourceforge.net/
  # This GitHub repo is a maintained fork with OSX support
  homepage "https://github.com/pc/tsocks"
  head "https://github.com/pc/tsocks.git"

  depends_on "autoconf" => :build

  def install
    system "autoconf", "-v"
    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--with-conf=#{etc}/tsocks.conf"

    inreplace("tsocks") { |s| s.change_make_var! "LIBDIR", lib }

    system "make"
    system "make", "install"
    etc.install "tsocks.conf.simple.example" => "tsocks.conf"
  end
end
