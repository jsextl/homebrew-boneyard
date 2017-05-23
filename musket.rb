class Musket < Formula
  homepage "http://musket.sourceforge.net/"
  # doi "10.1093/bioinformatics/bts690"
  # tag "bioinformatics"

  url "https://downloads.sourceforge.net/project/musket/musket-1.1.tar.gz"
  sha256 "306772803ef72e6a7dfdfdf382d0fafa77de0eaa226500b0525940f6b5497aba"
  version "1.1"

  def install
    system "make"
    bin.install "musket"
    doc.install "LICENSE", "README"
  end

  test do
    system "#{bin}/musket 2>&1 |grep musket"
  end
end
