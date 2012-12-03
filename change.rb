require 'formula'

class Change < Formula

  homepage 'https://github.com/ketchup/change'
  url 'https://github.com/ketchup/change/zipball/v1.2.0'
  sha1 'cebfa1dd285a67ad2326572f083326ec9c067402'

  def test
    system "change"
  end

  def install
    bin.install 'bin/change' => 'change'
    prefix.install Dir["completions", "libexec", "share", "VERSION"]
  end

end
