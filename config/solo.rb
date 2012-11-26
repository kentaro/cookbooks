require 'pathname'

basedir = Pathname.new(__FILE__).realpath.dirname.parent

file_cache_path "/tmp/chef-repo"
cookbook_path   (basedir + "cookbooks").to_s
role_path       (basedir + "roles").to_s
