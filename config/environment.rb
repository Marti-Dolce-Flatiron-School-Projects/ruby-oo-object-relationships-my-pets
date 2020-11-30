# frozen_string_literal: true

require 'pry'
require 'rspec'
require_relative '../spec/spec_helper'
Dir[File.join(File.dirname(__FILE__), '../lib', '*.rb')].sort.each { |f| require f }
