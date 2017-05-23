class Bonnie < Formula
  desc "C-language benchmark measuring Unix filesystems perf"
  homepage "http://www.textuality.com/bonnie/"
  url "http://www.textuality.com/bonnie/bonnie.tar.gz"
  version "2.0.6"
  sha256 "e420ca9275ddd9aa5fdb27d86851a57eea5ff94e8ccf6ba71352d35546842937"
  head "http://bonnie-64.googlecode.com/svn/trunk/"

  def install
    system "make"
    bin.install "Bonnie" => "bonnie"
    man1.install "bonnie.1"
  end

  test do
    system "#{bin}/bonnie"
  end
end
