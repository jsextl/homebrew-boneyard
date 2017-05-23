class Squishyball < Formula
  desc "CLI utility for performing double-blind testing"
  homepage "https://xiph.org/"
  head "http://svn.xiph.org/trunk/squishyball"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  depends_on "libvorbis"
  depends_on "opusfile"
  depends_on "libao"
  depends_on "flac"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
    man1.install "squishyball.1"
  end

  test do
    system bin/"squishyball", "-V"
  end
end
