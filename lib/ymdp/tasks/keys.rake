require 'lib/init'

@key = ENV["key"] || ""
@key = @key.upcase

ASSETS_ROOT = "#{BASE_PATH}/app/assets"
YRB_ROOT = "#{ASSETS_ROOT}/yrb"

namespace :keys do
  desc "Add new translation keys"
  task :add_new do
    Dir["./app/assets/yrb/*.pres"].each do |path|
      # system "cat app/assets/new/keys_en-US.pres >> app/assets/yrb/keys_en-US.pres"
      new_path = path.gsub("yrb", "new")
      system "cat #{new_path} >> #{path}"
    end
  end
  
  desc "Add new translation keys since ENV['date']"
  task :new_since do
    @date = ENV["date"]
    if @date
      change_keys do |line|
        puts line
        if line =~ /#{@date}/
          @on ||= true
        end
        line if @on
      end
    else
      message = "Must define a date with 'date='"
      growl(message)
      raise message
    end
  end
  
  desc "Combine translation key files"
  task :combine do
    system "rm #{TMP_PATH}/*"
    each_locale do |path|
      puts path
      filename = path.split("/").last
      lang = "en-US"
      if filename =~ /_(.*)\.pres/
        lang = $1
      end
      
      File.open(path, "r") do |f|
        File.open("#{TMP_PATH}/keys_#{lang}.pres", "a") do |tmp|
          tmp.write(f.read)
        end
      end
    end
    
    system "rm -rf #{YRB_ROOT}/*"
    system "cp #{TMP_PATH}/* #{YRB_ROOT}"
    
    system "rm #{TMP_PATH}/*"
  end
  
  desc "Destroy a translation key"
  task :destroy do
    system "rm #{TMP_PATH}/*"
    
    raise "Must define a key with 'key='" if @key == ""
    
    change_keys do |line|
      line_array = parse_yrb(line)
      
      if line_array[0] == @key
        line = ""
      end
      
      line
    end
    
    system "rm #{TMP_PATH}/*"
  end
  
  desc "Translate any new keys into non-US languages"
  task :translate do
    Dir["#{BASE_PATH}/app/assets/yrb/en-US/*.pres"].each do |path|
      Idiom::Base.translate(:source => path)
    end
  end
  
  desc "Rename a translation key"
  task :rename do
    system "rm #{TMP_PATH}/*"
    
    @to = ENV["to"] || ""
    @to = @to.upcase
    
    raise "Must define a key with 'key='" if @key == ""
    raise "Must define a new key name with 'to='" if @to == ""
    
    change_keys do |line|
      line_array = parse_yrb(line)
      
      if line_array[0] == @key
        line = "#{@to}=#{line_array[1]}"
      end
      
      line
    end
    
    system "rm #{TMP_PATH}/*"
  end
  
  desc "List translation keys"
  task :list do
    each_locale do |path|
      filename = path.split("/").last
      lang = "en-US"
      if filename =~ /_(.*)\.pres/
        lang = $1
      end
    
      puts lang
      
      File.open(path, "r") do |f|
        f.readlines.each do |line|
          puts line if line =~ /^#{@key}=/
        end
      end
    end
  end
  
  desc "Convert YRB translation files to YAML"
  task :convert_to_yml do
    each_locale do |path|
      # puts path
      filename = path.split("/").last
      lang = "en-US"
      if filename =~ /_(.*)\.pres/
        lang = $1
      end
    
      puts "#{lang}:"
      
      File.open(path, "r") do |f|
        f.readlines.each do |line|
          if @key.blank? || line =~ /^#{@key}=/
            k,v = parse_yrb(line)
            puts "      #{k.downcase}: #{v}"
          end
        end
      end
    end
  end
end

def change_keys
  each_locale do |path|
    @on = false
    puts path
    filename = path.split("/").last
    File.open(path, "r") do |f|
      File.open("#{TMP_PATH}/#{filename}", "w") do |tmp|
        f.readlines.each do |line|
          new_line = yield line
          tmp.write new_line
        end
      end
    end
    system "cp #{TMP_PATH}/#{filename} #{path}"
  end
end

def change_keys_with_lang
  each_locale do |path|
    puts path
    filename = path.split("/").last
    lang = "en-US"
    if filename =~ /_(.*)\.pres/
      lang = $1
    end
    File.open(path, "r") do |f|
      File.open("#{TMP_PATH}/#{filename}", "w") do |tmp|
        f.readlines.each do |line|
          new_line = yield line, lang, filename
          tmp.write new_line
        end
      end
    end
    system "cp #{TMP_PATH}/#{filename} #{path}"
  end
end

def parse_yrb(line)
  key = value = nil
  unless line =~ /#/
    tokens = line.split("=")
    key = tokens.shift
    value = tokens.join("=")
  end
  [key, value]
end

def each_locale
  Dir["#{YRB_ROOT}/*.pres"].each do |path|
    yield path
  end  
end

def to_yrb(key, value)
  "#{key}=#{value}\n"
end

def yrb_to_hash(path)
  hash = {}
  File.open(path, "r") do |f|
    f.readlines.each do |line|
      k, v = parse_yrb(line)
      
      if k
        hash[k] = v
      end
    end
  end
  hash
end

