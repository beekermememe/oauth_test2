require 'test_helper'

class GoogleUserTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GoogleUser.new.valid?
  end
end
