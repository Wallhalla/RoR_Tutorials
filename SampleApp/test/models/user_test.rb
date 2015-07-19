require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @valid_user = User.new(name: "TestUser", email: "TestUser@example.com")
  end
  
  test "should be valid" do
    assert @valid_user.valid?
  end
  
  test "name should be present" do
    @valid_user.name = "  "
    assert_not @valid_user.valid?
  end
  
end
