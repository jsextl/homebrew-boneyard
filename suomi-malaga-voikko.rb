class SuomiMalagaVoikko < Formula
  desc "Linguistic software and data for Finnish"
  homepage "http://voikko.puimula.org/"
  url "http://www.puimula.org/voikko-sources/suomi-malaga/suomi-malaga-1.19.tar.gz"
  sha256 "5c4c15dd87a82e9b8ab74f9c570c6db011e3fd824db4de47ffeb71c4261451cc"

  head "https://github.com/voikko/corevoikko.git"

  depends_on "malaga"

  def install
    Dir.chdir "suomimalaga" if build.head?
    system "make", "voikko"
    system "make", "voikko-install", "DESTDIR=#{lib}/voikko"
  end
end
