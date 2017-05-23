class Otx < Formula
  homepage "https://github.com/darwin/otx"
  head "https://github.com/darwin/otx.git"

  depends_on :xcode => :build

  def install
    xcodebuild "SYMROOT=build"
    bin.install "build/Release/otx"
    prefix.install "build/Release/otx.app"
  end
end
