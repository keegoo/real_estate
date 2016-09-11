require '../test_helper'

class DistrictTest < Minitest::Test
  def setup
    @pages_1 =<<EOF
<h1 class="title search-title">
    <span>2,130</span> Property for Sale in Singapore, in Boat Quay / Raffles Place / Marina.
    <a href="/save-search?freetext=D01+Boat+Quay+/+Raffles+Place+/+Marina&amp;district_code%5B0%5D=D01&amp;listing_type=sale&amp;alert=1" id="alert-create-alert-button" class="create-alert" rel="nofollow">Create Alert</a>.
</h1>
EOF

    @property_list =<<EOF
<div class="listing-list">
  <li class="listing-item featured-company-listing  listing-id-20109700 "><div></div></li>
  <li class="listing-item featured-company-listing  listing-id-20109679 "><div></div></li>
  <li class="listing-item  listing-id-19636039 "><div></div></li>
  <li class="listing-item  listing-id-20029146 "><div></div></li>
  <li class="listing-item  listing-id-20232926 "><div></div></li>
  <li class="listing-item  listing-id-17144212 "><div></div></li>
</div>
EOF

    # initialize dct
    RealEstate::HTMLBuilder.stub :pages_count, @pages_1 do
      @dct = RealEstate::District.new("D15", "some text")
    end
  end

  def test_initialize
    RealEstate::HTMLBuilder.stub :pages_count, @pages_1 do
      # normal cases
      dct = RealEstate::District.new("D15", "some text")
      assert_equal "D15", dct.code
      assert_equal "some text", dct.freetext
      

      # when one of the parameters is nil
      assert_raises ArgumentError do
        dct = RealEstate::District.new("D15", nil)
      end

      assert_raises ArgumentError do
        dct = RealEstate::District.new(nil, nil)
      end
    end
  end

  def test_pages
    # normal case
    RealEstate::HTMLBuilder.stub :pages_count, @pages_1 do
      dct = RealEstate::District.new("D15", "some text")
      assert_equal 2130, dct.pages
    end

    RealEstate::HTMLBuilder.stub :pages_count, "" do
      # when cannot find pages count in html
      assert_raises RuntimeError do
        dct = RealEstate::District.new("D15", "some text")
        dct.pages
      end
    end
  end

  def test_properties_at_page
    RealEstate::HTMLBuilder.stub :page, @property_list do
      hash = {
        id: "12345",
        location: "Bedok",
        type: "condo",
        tenure: "99-years",
        href: "http://xxx.com/12345/property"
      }
      ppt = RealEstate::Property.new(hash)
      RealEstate::Property.stub :get_property_from_html, ppt do 
        properties = @dct.properties_at_page(1)
        assert_equal 6, properties.length
        assert_equal "12345", properties[0].id
        assert_equal "12345", properties[1].id
      end
    end
  end
end