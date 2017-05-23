class Libqxt < Formula
  homepage "http://libqxt.org/"
  url "http://dev.libqxt.org/libqxt/get/v0.6.2.tar.gz"
  sha256 "5ef4267c64a6fa59c1c632b5803924fa40ec6b6556d8a072c868ff7e7a4d647e"

  # As of 26/07/2014 this formula is no longer maintained upstream.
  # http://dev.libqxt.org/libqxt/wiki/commits/7e7a0ad676e649bf6f64a2cad1ea6dd204fb766c
  depends_on "qt"
  depends_on "berkeley-db" => :optional

  # Patch src/gui/qxtglobalshortcut_mac.cpp to fix a bug caused by obsolete
  # constants in Mac OS X 10.6.
  # http://dev.libqxt.org/libqxt-old-hg/issue/50/
  patch do
    url "https://gist.githubusercontent.com/uranusjr/6019051/raw/866c99ee0031ef2ca7fe6b6495120861d1bd5ec8/qxtglobalshortcut_mac.cpp.diff"
    sha256 "9bff7538d6b1616317b3b861bec78403ac32026607dce673b43d7edcb537e115"
  end

  def install
    args = ["-prefix", prefix,
            "-libdir", lib,
            "-bindir", bin,
            "-docdir", "#{prefix}/doc",
            "-featuredir", "#{prefix}/features",
            "-release"]
    args << "-no-db" if build.without? "berkeley-db"

    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
