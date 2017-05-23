class Daala < Formula
  homepage "https://xiph.org/daala/"

  head do
    url "https://git.xiph.org/daala.git"

    depends_on "pkg-config" => :build
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "libogg"
  depends_on "libpng"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--disable-doc",
                          "--disable-unit-tests",
                          "--disable-player",
                          "--disable-tools",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
