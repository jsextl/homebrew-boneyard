class Pdksh < Formula
  desc "Public domain version of the Korn shell"
  homepage "https://web.archive.org/web/20160719151612/http://www.cs.mun.ca/~michael/pdksh/"
  url "https://www.cs.mun.ca/~michael/pdksh/files/pdksh-5.2.14.tar.gz"
  mirror "http://gd.tuwien.ac.at/utils/shells/pdksh/pdksh-5.2.14.tar.gz"
  mirror "ftp://ftp.lip6.fr/pub/unix/shells/pdksh/pdksh-5.2.14.tar.gz"
  sha256 "ab15bcdd50f291edc632bca351b2edce5405d4f2ce3854d3d548d721ab9bbfa6"

  # Upstream patch
  # Used to be https://www.cs.mun.ca/~michael/pdksh/files/pdksh-5.2.14-patches.1
  patch :p2 do
    url "https://raw.githubusercontent.com/homebrew/patches/fa25f8f/pdksh/pdksh-5.2.14-patches.1"
    sha256 "b4adfc47e4d78eb8718ee10f7ffafc218b0e9d453413456fab263985ae02d356"
  end

  # Upstream patch
  # Used to be https://www.cs.mun.ca/~michael/pdksh/files/pdksh-5.2.14-patches.2
  patch :p0 do
    url "https://raw.githubusercontent.com/homebrew/patches/fa25f8f/pdksh/pdksh-5.2.14-patches.2"
    sha256 "82041113e0b3aeca57bb9b161257b43d9f8eba95fd450d2287666e77e6209afd"
  end

  # Use `sort -k 3n -k 1` instead of `sort +2n +0n`, via MacPorts
  # https://github.com/macports/macports-ports/blob/a3395cb/shells/pdksh/files/patch-siglist.sh.diff
  patch :p0 do
    url "https://raw.githubusercontent.com/Homebrew/formula-patches/af7a9de9/pdksh/patch-siglist.sh"
    sha256 "23a3b4cbf67886c358a26818a95f9b39304d0aab82dead78d5438b633a0917bc"
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--program-prefix=pd"
    system "make", "install"

    share.install prefix/"man" # Avoid an inreplace this way.
    prefix.install buildpath/"etc"
  end

  test do
    assert_equal "Hello World!", pipe_output("#{bin}/pdksh -c 'echo Hello World!'").chomp
  end
end
