require 'formula'

class With < Formula
  homepage 'https://github.com/ketchup/with'
  url 'https://github.com/ketchup/with/zipball/master'
  sha1 '93b5c2fc60981f1a8cd92a05072598e461f85e32'
  version '0.0.0'

  def install
    bin.install 'with' => 'with'
  end
end
