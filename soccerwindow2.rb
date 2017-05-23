class Soccerwindow2 < Formula
  desc "Tools for RoboCup Soccer Simulator"
  homepage "https://osdn.jp/projects/rctools/"
  url "http://dl.osdn.jp/rctools/51942/soccerwindow2-5.1.0.tar.gz"
  sha256 "3505f662144d5c97628191c941e84af4d384770733b9ff93ab8b58c2d1b9c22b"

  depends_on "pkg-config" => :build
  depends_on "qt"
  depends_on "boost"
  depends_on "librcsc"

  def install
    # ld: framework not found Security-lz; also affects the rcssserver formula
    # Reported 10 May 2016:
    #   https://osdn.jp/ticket/browse.php?group_id=213&tid=36316
    #   https://sourceforge.net/p/sserver/discussion/76440/thread/e61e21e8/
    # Previously reported 14 Jan 2016:
    #   https://sourceforge.net/p/sserver/mailman/message/34765272/
    inreplace "configure",
      "$QT4_REQUIRED_MODULES)$($PKG_CONFIG",
      "$QT4_REQUIRED_MODULES) $($PKG_CONFIG"

    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match "soccerwindow2 Version #{version}", shell_output("#{bin}/soccerwindow2 -v", 1)
  end
end
