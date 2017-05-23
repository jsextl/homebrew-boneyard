class RedisTools < Formula
  desc "Tools for Redis"
  homepage "https://github.com/antirez/redis-tools"
  head "https://github.com/antirez/redis-tools.git"

  # Fix a compilation error with clang >=4.1
  patch do
    url "https://github.com/antirez/redis-tools/pull/5.patch"
    sha256 "e110399c036356df342079e5b832fd585cf293b473bd2925df4e6aececf23c64"
  end

  def install
    # Architecture isn't detected correctly on 32bit Snow Leopard without help
    ENV["OBJARCH"] = MacOS.prefer_64_bit? ? "-arch x86_64" : "-arch i386"
    # -rdynamic is not supported on OS X
    inreplace "Makefile", "-rdynamic", ""
    system "make"
    bin.install %w[redis-load redis-stat]
  end

  test do
    shell_output("#{bin}/redis-load --help", 1)
    shell_output("#{bin}/redis-stat --help", 1)
  end
end
