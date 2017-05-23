class Luarocks < Formula
  homepage "http://luarocks.org"
  url "http://luarocks.org/releases/luarocks-2.2.1.tar.gz"
  sha256 "713f8a7e33f1e6dc77ba2eec849a80a95f24f82382e0abc4523c2b8d435f7c55"

  head "https://github.com/keplerproject/luarocks.git"

  depends_on "lua"

  keg_only "Luarocks is being merged into Lua formulae imminently & this eases transition."

  fails_with :llvm do
    cause "Lua itself compiles with llvm, but may fail when other software tries to link."
  end

  def install
    # Install to the Cellar, but direct modules to HOMEBREW_PREFIX
    # Specify where the Lua is to avoid accidental conflict.
    lua_prefix = Formula["lua"].opt_prefix

    args = ["--prefix=#{prefix}",
            "--rocks-tree=#{HOMEBREW_PREFIX}",
            "--sysconfdir=#{etc}/luarocks",
            "--with-lua=#{lua_prefix}",
            "--lua-version=5.2"]

    system "./configure", *args
    system "make", "build"
    system "make", "install"
  end

  def caveats; <<-EOS.undent
    Rocks are installed to: #{HOMEBREW_PREFIX}/lib/luarocks/rocks

    A configuration file has been placed at #{HOMEBREW_PREFIX}/etc/luarocks
    which you can use to specify additional dependency paths as desired.
    See: http://luarocks.org/en/Config_file_format
    EOS
  end

  test do
    system "#{bin}/luarocks", "install", "say"
  end
end
