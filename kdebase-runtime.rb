require "formula"

class KdebaseRuntime < Formula
  homepage "http://www.kde.org/"
  url "http://pkgs.fedoraproject.org/lookaside/pkgs/kdebase-runtime/kdebase-runtime-4.6.0.tar.bz2/1f9d6bc64d7b84a74dd3ab06615c71ce/kdebase-runtime-4.6.0.tar.bz2"
  sha256 "072d442e5ee2bb976987093a498c667c0a4a1205d5ee1dde844b23718fa792ef"

  depends_on "cmake" => :build
  depends_on "kde-phonon"
  depends_on "oxygen-icons"

  def install
    phonon = Formula.factory "kde-phonon"
    system "cmake #{std_cmake_parameters} -DPHONON_INCLUDE_DIR=#{phonon.include} -DPHONON_LIBRARY=#{phonon.lib}/libphonon.dylib -DBUNDLE_INSTALL_DIR=#{bin} ."
    system "make install"
  end
end
