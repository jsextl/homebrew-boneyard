class Scsh < Formula
  desc "Scheme shell"
  homepage "https://scsh.net/"
  url "https://ftp.scsh.net/pub/scsh/0.6/scsh-0.6.7.tar.gz"
  sha256 "c4a9f7df2a0bb7a7aa3dafc918aa9e9a566d4ad33a55f0192889de172d1ddb7f"

  head do
    url "https://github.com/scheme/scsh.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "scheme48"
  end

  def install
    if build.head?
      system "autoreconf"
    else
      # will not build 64-bit
      ENV.m32
    end

    # build system is not parallel-safe
    ENV.deparallelize
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}"
    system "make", "install"
    rm_rf include
  end

  test do
    (testpath/"hello.scm").write <<-EOS.undent
      (display "Hello, World!") (newline)
    EOS

    assert_equal "Hello, World!\n", shell_output("#{bin}/scsh -s hello.scm")
  end
end
