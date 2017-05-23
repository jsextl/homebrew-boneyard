class Scantailor < Formula
  desc "Interactive post-processing tool for scanned pages"
  homepage "http://scantailor.org/"
  url "https://github.com/scantailor/scantailor/archive/RELEASE_0_9_12_2.tar.gz"
  sha256 "1f7b96bbe5179d46e332aea8d51ba50545fe7c510811e51588b6a4919e4feeab"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "jpeg"
  depends_on "libtiff"
  depends_on "qt"
  depends_on :x11

  def install
    system "cmake", ".", "-DPNG_INCLUDE_DIR=#{MacOS::X11.include}", *std_cmake_args
    system "make", "install"
  end

  test do
    (testpath/"foo.file").write "foo"
    (testpath/"bar/foo2.file").write "foo2"
    (testpath/"bar/foo3.file").write "foo3"
    output = pipe_output("#{bin}/scantailor-cli -v --end-filter=1 foo.file bar bar")
    assert_equal <<-EOS.undent, output
    Filter: 1
    \tProcessing: #{testpath.realpath}/foo.file
    \tProcessing: #{testpath.realpath}/bar/foo2.file
    \tProcessing: #{testpath.realpath}/bar/foo3.file
    EOS
  end
end
