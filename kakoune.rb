class Kakoune < Formula
  homepage "https://github.com/mawww/kakoune"
  head "https://github.com/mawww/kakoune.git"

  depends_on "boost"

  def install
    system "make", "-C", "src", "install", "PREFIX=#{prefix}"
  end
end
