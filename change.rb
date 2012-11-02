require 'formula'

class Change < Formula
  url 'https://github.com/ketchup/change'
  url 'https://github.com/ketchup/change/zipball/v1.0.0'
  sha1 'a45eb5a3c78fdf6dd75ce72cfa67e4f8096fff7f'

  def test
    system "change"
  end

  def install
    bin.install 'bin/change' => 'change'
    prefix.install Dir["libexec", "share"]
  end
end
