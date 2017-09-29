require 'test_helper'

class CategoryTest < ActiveSupport::TestCase


  def setup

   @category = Category.new(name: "programming")

  end

  test 'category should be valid!' do
    assert @category.valid?
  end

  test 'name should be present' do
    @category.name=" "
    assert_not @category.valid?
  end

  test 'name-length should be greater than 5 ' do
    @category.name="betim"
    assert @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "programming")
    binding.pry
    assert_not category2.valid?
    binding.pry

end


end
