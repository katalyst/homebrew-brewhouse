require 'formula'

class With < Formula
  homepage 'https://github.com/ketchup/with'
  url 'https://github.com/ketchup/with/zipball/v0.1.0'
  sha1 '97723cce3a85b9d0cb04e1c0b84e103170e545e2'

  def install
    bin.install 'bin/with' => 'with'
    prefix.install Dir["environment", "template"]
  end
end
