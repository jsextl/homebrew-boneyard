require "formula"

class Attica < Formula
  homepage "http://www.kde.org/"
  url "https://mirror.csclub.uwaterloo.ca/kde/stable/attica/attica-0.2.0.tar.bz2"
  sha256 "2af9f17c7cefa806e606dfeb3b4d5d9bb74d6f486c9700554121b7e74252543c"

  depends_on "cmake" => :build

  def install
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end
