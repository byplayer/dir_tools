# rename YYYY.MM(.DD_xxx) dir or file to YYYYMMDD_xxx

require 'fileutils'

def rename_dots
  Dir.glob('**/**').each do |f|
    base_name = File.basename(f, '*.*')
    # puts f
    next unless base_name =~ /^([0-9]{4})\.([0-9]{2})\.*(.*)/

    new_name = "#{Regexp.last_match[1]}#{Regexp.last_match[2]}#{Regexp.last_match[3]}"
    new_path = File.join(File.dirname(f), new_name)
    puts 'move'
    puts "  #{f} to"
    puts "  #{new_path}"

    FileUtils.mv(f, new_path)
    return false
  end

  true
end

until rename_dots
end
