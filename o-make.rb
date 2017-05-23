require "formula"

class OMake < Formula
  url "http://pkgs.fedoraproject.org/repo/pkgs/ocaml-omake/omake-0.9.8.6-0.rc1.tar.gz/fe39a476ef4e33b7ba2ca77a6bcaded2/omake-0.9.8.6-0.rc1.tar.gz"
  homepage "http://omake.metaprl.org/"
  sha256 "23c498f071723621dd5e1e29c1abefd6937c73c67bb85d223fd514b9ae005ae9"
  version "0.9.8.6"

  depends_on "readline"
  depends_on "objective-caml"

  # skip all warnings that can happen with newer versions of ocamlc. Also,
  # work around a faulty readline detection, see
  # http://bugzilla.metaprl.org/cgi-bin/show_bug.cgi?id=740.
  patch :DATA

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end
end

__END__
diff --git a/OMakefile b/OMakefile
index 9b77a25..1d61d70 100644
--- a/OMakefile
+++ b/OMakefile
@@ -57,7 +57,7 @@ if $(not $(defined CAMLLIB))
 #
 # OCaml options
 #
-OCAMLFLAGS[] += -w Ae$(if $(OCAML_ACCEPTS_Z_WARNING), z)
+OCAMLFLAGS[] += -warn-error -a
 if $(THREADS_ENABLED)
     OCAMLFLAGS += -thread
     export
diff --git a/lib/configure/readline.om b/lib/configure/readline.om
index 39c2953..e5d18e6 100644
--- a/lib/configure/readline.om
+++ b/lib/configure/readline.om
@@ -39,9 +39,10 @@ open configure/ncurses
             READLINE_CFLAGS += -DREADLINE_ENABLED

             # Test for GNU
-            if $(CheckLib ncurses readline, rl_on_new_line)
+            if $(CheckLib ncurses readline history, history_list)
                 READLINE_GNU = true
                 READLINE_CFLAGS += -DREADLINE_GNU
+                READLINE_CLIBS += -lhistory
                 export

             export
