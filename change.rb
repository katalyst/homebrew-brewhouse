require 'formula'

class Change < Formula

  homepage 'https://github.com/ketchup/change'
  url 'https://github.com/ketchup/change/zipball/v1.1.0'
  sha1 '9cd85bf812c5c0b76067af0db70b53ac67a8d069'

  def test
    system "change"
  end

  def install
    bin.install 'bin/change' => 'change'
    prefix.install Dir["libexec", "share"]
  end

end
