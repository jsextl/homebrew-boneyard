class Wol < Formula
  desc "Small C application to wake a system via Wake-on-LAN"
  homepage "https://github.com/kylef/wol"
  head "https://github.com/kylef/wol.git"

  def install
    system "make"
    bin.install "bin/wol"
  end

  test do
    system "wol", "00:00:00:00:00:00"
  end
end
