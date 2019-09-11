Dir[File.dirname(__FILE__) + '/config/config.rb'].each {|file| load file }
Dir[File.dirname(__FILE__) + '/config/env/**/*.rb'].each {|file| load file }
Dir[File.dirname(__FILE__) + '/models/**/*.rb'].each {|file| load file }
