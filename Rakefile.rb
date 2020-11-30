require_relative './config/environment'

def reload!
  load './spec/spec_helper'
  Dir[File.join(File.dirname(__FILE__), './lib', '*.rb')].sort.each { |f| require f }
end
desc 'A console'
task :console do
  Pry.start
end