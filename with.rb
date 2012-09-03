require 'formula'

class With < Formula
  homepage 'https://github.com/ketchup/with'
  url 'https://github.com/ketchup/with/zipball/master'
  sha1 '97723cce3a85b9d0cb04e1c0b84e103170e545e2'
  version '0.0.0'

  def install
    bin.install 'bin/with' => 'with'
    prefix.install Dir["environment", "template"]
  end
end
