class ShaperProbe < Formula
  homepage "https://code.google.com/p/shaperprobe/"
  head "https://code.google.com/p/shaperprobe/"

  def install
    system "make -f Makefile.osx"
    bin.install "prober"
  end
end
