class Kati < Formula
  desc "kati is an experimental GNU make clone."
  homepage "https://github.com/google/kati"
  head "https://github.com/google/kati.git"

  depends_on "go"
  depends_on "ninja"
  needs :cxx11

  def install
    ENV.cxx11
    system "make", "all"
    bin.install "m2n", "ckati"
  end

  test do
    (testpath/"hello.c").write <<-EOS.undent
      #include <stdio.h>
      int main() {
        printf("hello kati\\n");
        return 0;
      }
    EOS

    (testpath/"Makefile").write <<-EOS.undent
      CC=cc
      CFLAGS=-I.

      hello: hello.c
      \t$(CC) -o hello hello.c
    EOS

    system "m2n"
    system "./ninja.sh"
    system "make"
    system "./hello"
  end
end
