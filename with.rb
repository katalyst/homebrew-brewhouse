require 'formula'

class With < Formula
  homepage 'https://github.com/ketchup/with'
  url 'https://github.com/ketchup/with/zipball/v0.1.0'
  sha1 '38e1709dfd1e7e4469d7360923ca8e077c5393d5'

  def test
    system "with"
  end

  def install
    bin.install 'bin/with' => 'with'
    prefix.install Dir["environment", "template"]
  end
end
