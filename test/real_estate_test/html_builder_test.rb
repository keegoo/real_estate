require '../test_helper'

class HTMLBuilderTest < Minitest::Test
  def setup
  end

  def test_districts
    HTTParty.stub :get, "<html></html>" do
      assert_equal "<html></html>", RealEstate::HTMLBuilder.districts
    end
  end

  def test_pages_count
    HTTParty.stub :get, "<html></html>" do
      assert_equal "<html></html>", RealEstate::HTMLBuilder.pages_count({})
    end
  end

  def test_page
    HTTParty.stub :get, "<html></html>" do
      assert_equal "<html></html>", RealEstate::HTMLBuilder.page({}, 1)
    end
  end
end