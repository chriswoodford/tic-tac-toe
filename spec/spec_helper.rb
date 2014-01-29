require 'coveralls'
Coveralls.wear!

require 'tic-tac-toe'
require 'helpers/board_helper'

RSpec.configure do |c|
  c.include Helpers::BoardHelper
end
