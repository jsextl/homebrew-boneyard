require "formula"

class KdePhonon < Formula
  homepage "http://phonon.kde.org/"
  url "http://mirrors.mit.edu/kde/stable/phonon/4.7.1/phonon-4.7.1.tar.xz"
  sha256 "4ff7802deeac1557166591deb9fc2bfdfcaacdeb5389d07f08255365fb91b75d"

  depends_on "cmake" => :build
  depends_on "automoc4" => :build
  depends_on "qt"
  depends_on "glib" => :build

  keg_only "This package is already supplied by Qt and is only needed by KDE packages."

  def install
    inreplace "cmake/FindPhononInternal.cmake",
        "BAD_ALLOCATOR AND NOT WIN32", "BAD_ALLOCATOR AND NOT APPLE"
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end
