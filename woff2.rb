class Woff2 < Formula
  desc "Woff2 compress and decompress by Google"
  homepage "https://github.com/google/woff2"
  head "https://github.com/google/woff2.git"

  needs :cxx11

  resource "testfont" do
    url "https://raw.githubusercontent.com/google/fonts/master/apache/opensans/OpenSans-Regular.ttf"
    sha256 "e64e508b2aa2880f907e470c4550980ec4c0694d103a43f36150ac3f93189bee"
  end

  def install
    ENV.cxx11

    system "make", "clean", "all"
    bin.install "woff2_compress", "woff2_decompress"
  end

  test do
    resource("testfont").stage testpath
    system "woff2_compress", "OpenSans-Regular.ttf"
    system "woff2_decompress", "OpenSans-Regular.woff2"
  end
end
