require "formula"

class Dbslayer < Formula
  homepage "http://code.nytimes.com/projects/dbslayer/wiki"
  url "https://distfiles.macports.org/dbslayer/dbsayer-beta-12.tgz"
  version "0.12.b"
  sha256 "66a0cca0eb6f47a6735cfe55413a86ea67ebaf24e0b40be740840a8f0464c6b9"

  depends_on :mysql

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
