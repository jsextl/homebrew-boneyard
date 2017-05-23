require "formula"

class Librets < Formula
  homepage "http://code.crt.realtors.org/projects/librets"
  url "https://github.com/NationalAssociationOfRealtors/libRETS/archive/1.5.3.tar.gz"
  sha256 "30216f2640c3fa05c362caad823b8abf839e8f880b18dc10bf517fc791f03ab7"

  depends_on "homebrew/versions/boost149"

  def install
    old_boost = Formula.factory["boost149"]
    system "./configure", "--disable-debug",
                          "--enable-shared_dependencies",
                          "--prefix=#{prefix}",
                          "--with-boost-prefix=#{old_boost.prefix}",
                          "--disable-dotnet",
                          "--disable-java",
                          "--disable-perl",
                          "--disable-php",
                          "--disable-python",
                          "--disable-ruby"
    system "make install"
  end
end
