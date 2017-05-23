require "formula"

class Qimageblitz < Formula
  homepage "http://www.kde.org"
  url "http://pkgs.fedoraproject.org/repo/pkgs/qimageblitz/qimageblitz-0.0.6.tar.bz2/0ae2f7d4e0876764a97ca73799f61df4/qimageblitz-0.0.6.tar.bz2"
  sha256 "9f102269dec50641440e23a449df215a0db9efef9a3969939d618c5e78a5010f"

  depends_on "cmake" => :build
  depends_on "qt"

  def install
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end
