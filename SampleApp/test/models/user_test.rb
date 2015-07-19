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
  
  test "email should be present" do
    @valid_user.email = "  "
    assert_not @valid_user.valid?
  end
  
  test "name should not be too long" do
    @valid_user.name = "a" * 51
    assert_not @valid_user.valid?
  end
  
  test "email should not be too long" do
    sDomain = @valid_user.email.split('@')[1]
    @valid_user.email = "a" * 255 + sDomain
    assert_not @valid_user.valid?
  end
  
  test "email should be a valid email format" do
    
  end
  
end
