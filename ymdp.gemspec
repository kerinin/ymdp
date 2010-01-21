# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ymdp}
  s.version = "0.1.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Coleman"]
  s.date = %q{2010-01-21}
  s.default_executable = %q{ymdp}
  s.description = %q{Framework for developing applications in the Yahoo! Mail Development Platform.}
  s.email = %q{progressions@gmail.com}
  s.executables = ["ymdp"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "History.txt",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/ymdp",
     "lib/ymdp.rb",
     "lib/ymdp/application.rb",
     "lib/ymdp/application_view.rb",
     "lib/ymdp/asset_tag_helper.rb",
     "lib/ymdp/base.rb",
     "lib/ymdp/commands/build.rb",
     "lib/ymdp/commands/generate.rb",
     "lib/ymdp/compiler/base.rb",
     "lib/ymdp/compiler/domains.rb",
     "lib/ymdp/compiler/git_helper.rb",
     "lib/ymdp/compiler/options.rb",
     "lib/ymdp/compiler/template.rb",
     "lib/ymdp/configuration/config.rb",
     "lib/ymdp/configuration/constants.rb",
     "lib/ymdp/generator/templates/javascript.js",
     "lib/ymdp/generator/templates/stylesheet.css",
     "lib/ymdp/generator/templates/translation.pres",
     "lib/ymdp/generator/templates/view.html.haml",
     "lib/ymdp/processor/compressor.rb",
     "lib/ymdp/processor/form_post.rb",
     "lib/ymdp/processor/validator.rb",
     "lib/ymdp/processor/w3c.rb",
     "lib/ymdp/support/file.rb",
     "lib/ymdp/tag_helper.rb",
     "lib/ymdp/tasks/keys.rake",
     "lib/ymdp/tasks/ymdp.rake",
     "lib/ymdp/translator/base.rb",
     "spec/application_spec.rb",
     "spec/application_view_spec.rb",
     "spec/compiler_spec.rb",
     "spec/compiler_template_spec.rb",
     "spec/compressor_spec.rb",
     "spec/configuration_spec.rb",
     "spec/data/Rakefile",
     "spec/data/VERSION",
     "spec/data/app/.gitignore",
     "spec/data/app/assets/images/lightbox/lightbox_bg.png",
     "spec/data/app/assets/javascripts/OpenMailIntl.js",
     "spec/data/app/assets/javascripts/controls.js",
     "spec/data/app/assets/javascripts/date.js",
     "spec/data/app/assets/javascripts/dragdrop.js",
     "spec/data/app/assets/javascripts/effects.js",
     "spec/data/app/assets/javascripts/lowpro.js",
     "spec/data/app/assets/javascripts/prototype.js",
     "spec/data/app/assets/javascripts/scriptaculous.js",
     "spec/data/app/assets/yrb/en-US/application_en-US.pres",
     "spec/data/app/helpers/application_helper.rb",
     "spec/data/app/javascripts/application.js",
     "spec/data/app/javascripts/debug.js",
     "spec/data/app/javascripts/flash.js",
     "spec/data/app/javascripts/header.js",
     "spec/data/app/javascripts/help.js",
     "spec/data/app/javascripts/i18n.js",
     "spec/data/app/javascripts/launcher.js",
     "spec/data/app/javascripts/logger.js",
     "spec/data/app/javascripts/tag_helper.js",
     "spec/data/app/stylesheets/application.css",
     "spec/data/app/stylesheets/ie.css",
     "spec/data/app/stylesheets/ie6.css",
     "spec/data/app/stylesheets/ie7.css",
     "spec/data/app/stylesheets/ie8.css",
     "spec/data/app/stylesheets/lightbox.css",
     "spec/data/app/stylesheets/non_ie.css",
     "spec/data/app/views/layouts/application.html.haml",
     "spec/data/app/views/page.html.haml",
     "spec/data/app/views/shared/_error.html.haml",
     "spec/data/app/views/shared/_flash.html.haml",
     "spec/data/app/views/shared/_javascripts.html.haml",
     "spec/data/app/views/shared/_loading.html.haml",
     "spec/data/app/views/shared/_stylesheets.html.haml",
     "spec/data/config/categories.yml",
     "spec/data/config/config.yml",
     "spec/data/config/config.yml.example",
     "spec/data/config/constants.rb",
     "spec/data/config/content.yml",
     "spec/data/config/servers.yml",
     "spec/data/config/servers.yml.example",
     "spec/data/lib/init.rb",
     "spec/data/lib/tasks/environment.rake",
     "spec/data/lib/tasks/keys.rake",
     "spec/data/lib/tasks/setup.rake",
     "spec/data/lib/tasks/ymdp.rake",
     "spec/data/script/build",
     "spec/data/script/config",
     "spec/data/script/destroy",
     "spec/data/script/generate",
     "spec/data/script/gitrm",
     "spec/data/script/growl",
     "spec/data/script/images",
     "spec/data/script/jslint.js",
     "spec/data/script/langs",
     "spec/data/script/translate",
     "spec/data/script/ymdt",
     "spec/data/script/ymdt.old",
     "spec/data/script/yuicompressor-2.4.2.jar",
     "spec/default_settings.rb",
     "spec/domains_spec.rb",
     "spec/file_spec.rb",
     "spec/git_helper_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/stubs.rb",
     "spec/translator_spec.rb",
     "spec/validator_spec.rb",
     "spec/ymdp_base_spec.rb",
     "spec/ymdp_spec.rb",
     "test.rb",
     "ymdp.gemspec"
  ]
  s.homepage = %q{http://github.com/progressions/ymdp}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Framework for developing applications in the Yahoo! Mail Development Platform}
  s.test_files = [
    "spec/application_spec.rb",
     "spec/application_view_spec.rb",
     "spec/compiler_spec.rb",
     "spec/compiler_template_spec.rb",
     "spec/compressor_spec.rb",
     "spec/configuration_spec.rb",
     "spec/data/app/helpers/application_helper.rb",
     "spec/data/config/constants.rb",
     "spec/data/lib/init.rb",
     "spec/default_settings.rb",
     "spec/domains_spec.rb",
     "spec/file_spec.rb",
     "spec/git_helper_spec.rb",
     "spec/spec_helper.rb",
     "spec/stubs.rb",
     "spec/translator_spec.rb",
     "spec/validator_spec.rb",
     "spec/ymdp_base_spec.rb",
     "spec/ymdp_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.6"])
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
      s.add_runtime_dependency(%q<ruby-growl>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<sishen-rtranslate>, [">= 0"])
      s.add_runtime_dependency(%q<progressions-basepath>, [">= 0"])
      s.add_runtime_dependency(%q<progressions-g>, [">= 0"])
      s.add_runtime_dependency(%q<bundler>, [">= 0"])
      s.add_runtime_dependency(%q<timer>, [">= 0"])
      s.add_runtime_dependency(%q<serenity>, [">= 0"])
      s.add_runtime_dependency(%q<ymdp_generator>, [">= 0"])
      s.add_runtime_dependency(%q<ymdt>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.6"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<hpricot>, [">= 0"])
      s.add_dependency(%q<ruby-growl>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<sishen-rtranslate>, [">= 0"])
      s.add_dependency(%q<progressions-basepath>, [">= 0"])
      s.add_dependency(%q<progressions-g>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<timer>, [">= 0"])
      s.add_dependency(%q<serenity>, [">= 0"])
      s.add_dependency(%q<ymdp_generator>, [">= 0"])
      s.add_dependency(%q<ymdt>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.6"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<hpricot>, [">= 0"])
    s.add_dependency(%q<ruby-growl>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<sishen-rtranslate>, [">= 0"])
    s.add_dependency(%q<progressions-basepath>, [">= 0"])
    s.add_dependency(%q<progressions-g>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<timer>, [">= 0"])
    s.add_dependency(%q<serenity>, [">= 0"])
    s.add_dependency(%q<ymdp_generator>, [">= 0"])
    s.add_dependency(%q<ymdt>, [">= 0"])
  end
end

