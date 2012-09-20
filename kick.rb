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
    FLASH_VERSIONS.each do |flash_version|
      installed = true
      if File.directory?(flash_version[:directory])
        Dir["#{prefix}/*.jsfl"].each do |file|
          unless File.exist?("#{flash_version[:directory]}/Kick/#{File.basename(file)}")
            installed = false
          end
        end
      else
        installed = false
      end
      puts (installed ? "Installed for #{flash_version[:name]}." : "Not installed, or partially installed for #{flash_version[:name]}.")
    end
    true
  end

  def install
    prefix.install Dir["*"]
    FLASH_VERSIONS.each do |flash_version|
      if File.directory?(flash_version[:directory])
        Dir["#{prefix}/*.jsfl"].each do |file|
          mkdir_p "#{flash_version[:directory]}/Kick"
          system "ln -sfh \"#{file}\" \"#{flash_version[:directory]}/Kick\""
        end
      end
    end
  end

  def caveats
    text = "To unistall remove these directories:\n"
    FLASH_VERSIONS.each do |fv|
      text << "  #{fv[:directory]}/Kick\n" if File.directory?("#{fv[:directory]}/Kick")
    end
    text
  end

end
