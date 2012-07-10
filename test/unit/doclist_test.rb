require 'test_helper'

class DoclistTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Doclist.new.valid?
  end
end
