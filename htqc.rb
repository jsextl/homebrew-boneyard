class Htqc < Formula
  homepage "http://sourceforge.net/projects/htqc/"
  # doi "10.1186/1471-2105-14-33"
  # tag "bioinformatics"

  url "https://downloads.sourceforge.net/project/htqc/series%201/htqc-0.90.8-Source.tar.gz"
  sha256 "a960805f4312577ae0311dd2734b1362af6ef24128fcaede28392c7f80f9a74e"

  depends_on "cmake" => :build
  depends_on "boost"

  fails_with :clang do
    build 600
    cause "error: call to constructor of 'htio::FastaIO' is ambiguous"
  end

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/ht-stat", "--version"
  end
end
