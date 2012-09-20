require 'formula'

class Kick < Formula

  homepage 'https://github.com/ketchup/kick'
  url 'https://github.com/ketchup/kick/zipball/v1.0.0'
  sha1 'c86fc27085b5b29c0c8687de7d126907a156ba1b'

  FLASH_VERSIONS = [
    { :name => "Flash CS4", :directory => "#{ENV['HOME']}/Library/Application Support/Adobe/Flash CS4/en/Configuration/Commands" },
    { :name => "Flash CS5", :directory => "#{ENV['HOME']}/Library/Application Support/Adobe/Flash CS5/en_US/Configuration/Commands" },
    { :name => "Flash CS5.5", :directory => "#{ENV['HOME']}/Library/Application Support/Adobe/Flash CS5.5/en_US/Configuration/Commands" },
    { :name => "Flash CS6", :directory => "#{ENV['HOME']}/Library/Application Support/Adobe/Flash CS6/en_US/Configuration/Commands" }
  ]

  def test
    installed = true

    FLASH_VERSIONS.each do |flash_version|
      if File.directory?(flash_version[:directory]) && !File.directory?("#{flash_version[:directory]}/Kick")
        installed = false
      end
    end

    installed
  end

  def install
    FLASH_VERSIONS.each do |flash_version|
      puts "Installing for #{flash_version[:name]}..."
      system "cp ./ #{flash_version[:directory]}/Kick"
      puts "Complete."
    end
  end

  def caveats
    text = "To unistall remove this directories:\n"
    FLASH_VERSIONS.each { |fv| text << "  #{fv[:directory]}/Kick\n" }
    text
  end

end
