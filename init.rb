### Food Finder ###
#
# To launch the project, excute this file


APP_ROOT = File.dirname(__FILE__)


#the best way to require the file 'guide.rb'
$: .unshift(File.join(APP_ROOT, 'lib'))
require 'guide'

guide = Guide.new('restaurants.txt')
guide.launch!

#other ways
#require File.join(APP_ROOT, 'lib', 'guide.rb')
#require File.join(APP_ROOT, 'lib', 'guide')

#not safe
#require "#{APP_ROOT}/lib/guide"   
