require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chef_name: "carlos a. perez", email: "capdev17@outlook.com")
  end
    
  test "chef_name should be valid" do
    assert @chef.valid?
  end
  
  test "chef_name should be present" do
   @chef.chef_name = " "
   assert_not @chef.valid?
  end
  
  test "chef_name should not be to long" do
    @chef.chef_name = "aa"
  assert_not @chef.valid?
  end
  
  test "chef_name should not be to short" do
    @chef.chef_name = "a" * 41
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "email length should be within bound" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses =%w[user@eee.com R_TDD-DS@eee.hello.org first.last@eem.au laura+joe@monk.cm]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
  end
end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses =%w[user@example,com user_at_ee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @chef.email= ia
      assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end
  end
   
end
  
  
  
  

