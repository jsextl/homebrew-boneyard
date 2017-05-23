class Libnice < Formula
  desc "GLib ICE implementation"
  homepage "https://wiki.freedesktop.org/nice/"
  url "https://nice.freedesktop.org/releases/libnice-0.1.7.tar.gz"
  sha256 "4ed165aa2203136dce548c7cef735d8becf5d9869793f96b99dcbbaa9acf78d8"

  depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on "gstreamer"

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking",
                          "--disable-silent-rules"
    system "make", "install"
  end
end
