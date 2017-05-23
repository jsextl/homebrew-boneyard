class Gitstats < Formula
  desc "Git history statistics generator"
  homepage "http://gitstats.sourceforge.net/"
  head "https://github.com/hoxu/gitstats.git"

  depends_on "gnuplot"

  def install
    inreplace "gitstats", "#!/usr/bin/env python2", "#!/usr/bin/env python"

    system "make", "install", "PREFIX=#{prefix}"
    system "make", "man"
    man1.install "doc/gitstats.1"
  end

  test do
    system "#{bin}/gitstats"
  end
end
