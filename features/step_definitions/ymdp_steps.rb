Given %r{I load config.yml} do
  require 'ymdp/configuration/constants'
end

Then %r{my "([^\"]*)" setting should be "([^\"]*)"} do |key, value|
  YMDP::Base.configuration.send(key).should == value
end

Given %r{I compile the application with the message "([^\"]*)"} do |message|
  begin
    @options = {
      :commit => false,
      :branch => "master",
      :base_path => BASE_PATH,
      :servers => SERVERS,
      :message => message
    }
    Object.send(:remove_const, :YMDP_ENV) if defined?(YMDP_ENV)
    YMDP_ENV = "build"
    YMDP::Compiler::Domains.new(@options).compile
  rescue StandardError => e
    @exception = e.message
  end
end

And %r{I should see "([^\"]*)" in "([^\"]*)"} do |content, path|
  File.read("#{BASE_PATH}/#{path}").should =~ /#{content}/
end

Given %r{the file "([^\"]*)" exists with "([^\"]*)"} do |filename, content|
  content.gsub!("\\n", "\n")
  File.open("#{BASE_PATH}/#{filename}", "w") do |f|
    content.split("\n").each do |line|
      f.puts line
    end
  end
  @files << "#{BASE_PATH}/#{filename}"
end

Then /^an exception should have been raised with the message "([^\"]*)"$/ do |message|
  @exception.should == message
end

Then %r{no exceptions should have been raised} do
  @exception.should be_nil
end

And %r{I remove the file "([^\"]*)"} do |filename|
  system "rm #{BASE_PATH}/#{filename}"
end

When %r{I deploy the application} do
  
end