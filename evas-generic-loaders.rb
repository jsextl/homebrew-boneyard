class EvasGenericLoaders < Formula
  desc "Extra complex image type loaders for Enlightenment"
  homepage "https://enlightenment.org"
  url "https://download.enlightenment.org/rel/libs/evas_generic_loaders/evas_generic_loaders-1.17.0.tar.gz"
  sha256 "be46c1619677dd6d1947a3db6eeaa9b8099f0e1684d72c4182304536bdb1e3dd"

  depends_on "pkg-config" => :build
  depends_on "efl"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
