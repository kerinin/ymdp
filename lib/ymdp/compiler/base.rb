# Compiles the source code for an individual domain.
#
# Usage:
#
#   @compiler = YMDP::Compiler::Base.new('staging', 'asdfh23rh2fas', :base_path => ".", :server => {
#     "server" => "staging", "application_id" => "12345", "assets_id" => "abcdefg_1" })
#
# You can then compile the domain:
#
#   @compiler.build
#
module YMDP
  module Compiler
    class Base
      attr_accessor :domain, :git_hash, :options, :base_path, :server
  
      # A TemplateCompiler instance covers a single domain, handling all the processing necessary to 
      # convert the application source code into usable destination files ready for upload.
      #
      def initialize(domain, git_hash, options={})
        @domain = domain
        @git_hash = git_hash
        @options = options
        @base_path = options[:base_path]
        @server = options[:server]
        
        raise ArgumentError.new("base_path is required") unless @base_path
      end
      
      # Perform all the processing for a single domain.
      #
      # This is the main method on this object.
      #
      def process_all
        create_directory("servers/#{domain}")
        clean_domain
        ["views", "assets"].each do |dir|
          process_path("#{base_path}/app/#{dir}/")
        end
        process_all_translations
        copy_images
      end

      # Do all the processing necessary to convert all the application source code from the given path
      # into usable destination files ready for upload to the server:
      #
      # - create server directory if necessary,
      # - for each file in the source path, build the file, and
      # - copy the images from the source to the destination directory.
      #
      def process_path(path)
        $stdout.puts "Processing #{path} for #{domain}"
        process_all_files(path)
      end
  
      # Process all code files (HTML and JavaScript) into usable, complete HTML files.
      #
      def process_all_files(path)
        Dir["#{path}**/*"].each do |f|
          build_file(f)
        end    
      end
  
      # Build this file if it's either:
      #   - a view, but not a partial or layout, or
      #   - a JavaScript file.
      #
      def build_file(file)
        params = {
          :file => file, 
          :domain => domain, 
          :git_hash => git_hash, 
          :message => options[:message], 
          :verbose => options[:verbose], 
          :base_path => base_path,
          :server => server
        }
        if build?(file)
          if file =~ /(\.haml|\.erb)$/
            YMDP::Compiler::Template::View.new(params).build
          elsif file =~ /\.js$/
            YMDP::Compiler::Template::JavaScript.new(params).build
          end
        end
      end
  
      # Convert all YRB translation files from YRB ".pres" format into a single JSON file per language.
      #
      def process_all_translations
        $stdout.puts "Processing ./app/assets/yrb/ for #{domain}"
        YMDP::Base.supported_languages.each do |lang|
          process_each_yrb(lang)
        end
      end
  
      # Convert the YRB translation files of a single language for this domain into a single JSON file.
      #
      def process_each_yrb(lang)
        tmp_file = "#{TMP_DIR}/keys_#{lang}.pres"
    
        # Concatenate together all the YRB ".pres" files for this language into one file in the tmp dir.
        #
        F.concat_files("#{yrb_path}/#{lang}/*", tmp_file)
    
        yrb = YMDP::Compiler::Template::YRB.new(:file => tmp_file, :domain => domain)
        yrb.build
        yrb.validate if CONFIG.validate_json_assets?
        
        FileUtils.rm(tmp_file)
      end
  
      # Creates a fresh destination directory structure for the code to be compiled into.
      #
      def clean_domain
        dir = "#{servers_path}/#{domain}"
        FileUtils.rm_rf("#{dir}/views")
        FileUtils.rm_rf("#{dir}/assets/javascripts")
        FileUtils.rm_rf("#{dir}/assets/stylesheets")
        FileUtils.rm_rf("#{dir}/assets/yrb")
        FileUtils.rm_rf("#{TMP_DIR}/")
        FileUtils.mkdir_p(TMP_DIR)
      end

      # Format text in a standard way for output to the screen.
      #
      def log(text)
        "#{Time.now.to_s} #{text}"
      end
  
      # Convert a file's path from its source to its destination.
      #
      # The source directory is in the 'app' directory.
      #
      # The destination directory is made from the 'servers' root and the domain name.
      #
      # For example: 
      #   - ./servers/staging
      #   - ./servers/alpha
      #
      def destination(path)
        destination = path.dup
        destination.gsub!("#{base_path}/app", "#{servers_path}/#{domain}")
      end
  
      # If this directory doesn't exist, create it and print that it's being created.
      #
      def create_directory(path)
        dest = destination(path)
    
        unless File.exists?("#{base_path}/#{path}")
          $stdout.puts "     create #{path}"
          FileUtils.mkdir_p("#{base_path}/#{path}")
        end
      end
  
      # Images don't require any processing, just copy them over into this domain's assets directory.
      #
      def copy_images
        if options[:verbose]
          $stdout.puts log("Moving images into #{servers_path}/#{domain}/assets/images...")
        end
        FileUtils.rm_rf("#{servers_path}/#{domain}/assets/images")
        FileUtils.mkdir_p("#{servers_path}/#{domain}/assets")
        FileUtils.cp_r("#{images_path}/", "#{servers_path}/#{domain}/assets")
      end
  
      # A filename beginning with an underscore is a partial.
      #
      def partial?(file)
        file.split("/").last =~ /^_/
      end
  
      # A file in the layouts directory is a layout.
      #
      def layout?(file)
        file =~ /\/app\/views\/layouts\//
      end
  
      # Build if it's not a partial and not a layout.
      #
      def build?(file)
        !partial?(file) && !layout?(file)
      end
      
      def app_path
        "#{base_path}/app"
      end
      
      def assets_path
        "#{app_path}/assets"
      end
      
      def yrb_path
        "#{assets_path}/yrb"
      end
      
      def images_path
        "#{assets_path}/images"
      end
      
      def servers_path
        "#{app_path}/servers"
      end
    end
  end
end