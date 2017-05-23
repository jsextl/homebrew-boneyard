class Vcontrold < Formula
  desc "Control and log Viessmann boilers."
  homepage "https://openv.wikispaces.com/vcontrold"
  head "http://svn.code.sf.net/p/vcontrold/code/trunk"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libxml2"

  def install
    cd "vcontrold" do
      chmod 0755, "auto-build.sh"

      system "./auto-build.sh"
      system "./configure",
             "--prefix=#{prefix}",
             "--with-xml2-include-dir=#{Formula["libxml2"].opt_include}/libxml2"
      system "make", "install"
    end
  end

  test do
    assert_match /usage/, shell_output("#{sbin}/vcontrold --help", 1)
    assert_match /usage/, shell_output("#{bin}/vclient --help", 1)
  end
end
