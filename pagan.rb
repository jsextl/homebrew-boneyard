class Pagan < Formula
  homepage "http://wasabiapp.org/software/pagan/"
  # doi "10.1093/bioinformatics/bts198"
  # tag "bioinformatics"

  url "http://wasabiapp.org/download/pagan/pagan.src.20150723.tgz"
  version "0.61"
  sha256 "68de97558f3bb4a932b70ba097f851ce1680a59902437ac49d73d64af30fc83f"
  head "https://github.com/ariloytynoja/pagan-msa.git"

  depends_on "boost"
  depends_on "exonerate" => :recommended
  depends_on "mafft" => :recommended
  depends_on "raxml" => :recommended

  def install
    cd "src" do
      # Remove the explicit search of /usr/include
      inreplace "Makefile", "-I/usr/include ", ""

      # Fix error ld: library not found for -lboost_thread
      inreplace "Makefile", "-lboost_thread", "-lboost_thread-mt"

      # Fix undefined symbol boost::program_options::validators::check_first_occurrence
      inreplace "Makefile", "-Wl,-rpath,", ""

      system "make", "CC=#{ENV.cc}", "CXX=#{ENV.cxx}", "LINK=#{ENV.cxx}"
      bin.install "pagan"
    end
    doc.install "readme.txt", "VERSION_HISTORY"
    prefix.install "examples"
  end

  test do
    system "#{bin}/pagan", "--version"
  end
end
