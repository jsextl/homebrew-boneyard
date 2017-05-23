class Figtoipe < Formula
  # There are other tools in this repo as well, but as I don't know anything
  # about them, I'm keeping this to 'figtoipe', which already had a formula.
  homepage "https://github.com/otfried/ipe-tools/"
  head "https://github.com/otfried/ipe-tools.git"

  def install
    cd "figtoipe" do
      system "make"
      bin.install "figtoipe"
      man1.install "figtoipe.1"
      doc.install "README"
    end
  end
end
