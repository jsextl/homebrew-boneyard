require "formula"

class Kdelibs < Formula
  homepage "http://www.kde.org/"
  url "http://pkgs.fedoraproject.org/repo/pkgs/kdelibs/kdelibs-4.9.5.tar.xz/2155d7ae075a1c7e9c6398b381c67177/kdelibs-4.9.5.tar.xz"
  sha256 "fc977af4efe00e6cab1051dc7b2424b1a8aa434536c5a5f8f1f54417519b3427"

  depends_on "cmake" => :build
  depends_on "automoc4" => :build
  depends_on "gettext"
  depends_on "pcre"
  depends_on "jpeg"
  depends_on "giflib"
  depends_on "strigi"
  depends_on "soprano"
  depends_on "shared-desktop-ontologies"
  depends_on "shared-mime-info"
  depends_on "attica"
  depends_on "docbook"
  depends_on "d-bus"
  depends_on "qt"
  depends_on "libdbusmenu-qt"
  depends_on :x11

  def install
    gettext_prefix = Formula["gettext"].prefix
    docbook_prefix = Formula["docbook"].prefix
    docbook_dtd = "#{docbook_prefix}/docbook/xml/4.5"
    docbook_xsl = Dir.glob("#{docbook_prefix}/docbook/xsl/*").first
    mkdir "build" do
      system "cmake #{std_cmake_parameters} -DCMAKE_PREFIX_PATH=#{gettext_prefix} -DDOCBOOKXML_CURRENTDTD_DIR=#{docbook_dtd} -DDOCBOOKXSL_DIR=#{docbook_xsl} -DBUILD_doc=FALSE -DBUNDLE_INSTALL_DIR=#{bin} .."
      system "make install"
    end
  end
end
