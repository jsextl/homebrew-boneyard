require "formula"

class Hugs98 < Formula
  homepage "http://www.haskell.org/hugs/"
  url "http://pkgs.fedoraproject.org/repo/pkgs/hugs98/hugs98-plus-Sep2006.tar.gz/e03e0ad79750d037237c47ebe33fa20e/hugs98-plus-Sep2006.tar.gz"
  version "plus-Sep2006"
  sha256 "aafaca9ca544572ebef70bbe86b5eb0abaa5d7c11c0b766d7db72a46b022bed5"

  depends_on "readline"

  fails_with :clang do
    cause %(ERROR "../libraries/bootlib/Data/Dynamic.hs" - Module "Main" already loaded)
  end

  patch :p0 do
    url "https://trac.macports.org/export/80246/trunk/dports/lang/hugs98/files/patch-packages-base-include-HsBase.h.diff"
    sha256 "42667faa29dcd6860160f3941265f638f47a5c49371689bc50c8a6e5e3036a2a"
  end

  patch :p0 do
    url "https://trac.macports.org/export/80246/trunk/dports/lang/hugs98/files/patch-libraries-tools-make-bootlib.diff"
    sha256 "7e146e400557e4c5f4a445be012f19b95df802ba2a624c44fc188adc69259b30"
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
