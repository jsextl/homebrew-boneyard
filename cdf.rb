require "formula"

class Cdf < Formula
  homepage "http://bmp-plugins.berlios.de/misc/cdf/cdf.html"
  url "https://downloads.sourceforge.net/project/bmp-plugins.berlios/cdf-0.2.tar.gz"
  sha256 "3659ed779ec335c572f9ccec437469fc9c0e5c193f6b58f9e935bf337a080874"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
