require "formula"

class OxygenIcons < Formula
  homepage "http://www.oxygen-icons.org/"
  url "http://pkgs.fedoraproject.org/repo/pkgs/oxygen-icon-theme/oxygen-icons-4.11.4.tar.xz/af38ae892a25fea32ec6fd3941c09c52/oxygen-icons-4.11.4.tar.xz"
  sha256 "f85bf4438ebd82c38b74c3c552001b41beab105afd0b97cb6b6a96ebbbb0bef0"

  depends_on "cmake" => :build

  def install
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end
