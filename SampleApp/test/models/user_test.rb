require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @valid_user = User.new(name: "TestUser", email: "TestUser@example.com",
                           password: "foobar", password_confirmation: "foobar")
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
  
  test "should accept valid email formats" do
    
    valid_addresses = %w[
      user@example.com 
      USER@foo.COM 
      A_US-ER@foo.bar.org
      first.last@foo.jp
      alice+bob@baz.cn
      ]
    
    valid_addresses.each do |address|
      @valid_user.email = address
      
      assert @valid_user.valid?, "#{address.inspect} should be valid!"
    end
    
  end
  
  test "should reject invalid email formats" do
    
    invalid_addresses = %w[
      user@example,com 
      user_at_foo.org 
      user.name@example.
      foo@bar_baz.com
      foo@bar+baz.com
      ]
      
    invalid_addresses.each do | address |
      @valid_user.email = address
      
      assert_not @valid_user.valid?, "#{address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicated_user = @valid_user.dup
    
    duplicated_user.email = @valid_user.email.upcase
    
    @valid_user.save
    
    assert_not duplicated_user.valid?
  end

  test "password should have minimum length" do
    @valid_user.password = @valid_user.password_confirmation = "a" * 5
    assert_not @valid_user.valid?
  end
  
end
