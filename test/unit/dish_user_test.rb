require 'test_helper'

class DishUserTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert DishUser.new.valid?
  end
end
