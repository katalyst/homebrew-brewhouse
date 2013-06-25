require 'formula'

class Change < Formula

  homepage 'https://github.com/ketchup/change'
  url 'https://github.com/ketchup/change/zipball/v1.3.0'
  sha1 '99f93870d54be4c7b675e1d85c7e5320a4afb97e'

  def test
    system "change"
  end

  def install
    bin.install 'bin/change' => 'change'
    prefix.install Dir["libexec", "share", "VERSION"]
    bash_completion.install "completions/change.bash"
    zsh_completion.install 'completions/change.zsh' => '_change'
  end

end
