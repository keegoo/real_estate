require '../test_helper'

class DistrictTest < Minitest::Test
  def setup
    @distric_1 =<<EOF
<div class="dropdown-menu dropdown-multi-step dropdown-menu-right" role="menu">
  <div class="step-pane param-district_code step-pane-last">
    <ul class="step-options">
      <li class="dropdown-reset"><a href="#">All Districts</a></li>
      <li role="presentation" class="divider"></li>
      <li title="D01 Boat Quay / Raffles Place / Marina"><label><input type="checkbox" name="district_code[]" value="D01" autocomplete="off" title="D01 Boat Quay / Raffles Place / Marina" />D01 Boat Quay / Raffles Place / Marina</label></li>
      <li title="D02 Chinatown / Tanjong Pagar"><label><input type="checkbox" name="district_code[]" value="D02" autocomplete="off" title="D02 Chinatown / Tanjong Pagar" />D02 Chinatown / Tanjong Pagar</label></li>
      <li title="D03 Alexandra / Commonwealth"><label><input type="checkbox" name="district_code[]" value="D03" autocomplete="off" title="D03 Alexandra / Commonwealth" />D03 Alexandra / Commonwealth</label></li>
      <li title="D04 Harbourfront / Telok Blangah"><label><input type="checkbox" name="district_code[]" value="D04" autocomplete="off" title="D04 Harbourfront / Telok Blangah" />D04 Harbourfront / Telok Blangah</label></li>
      <li title="D05 Buona Vista / West Coast / Clementi New Town"><label><input type="checkbox" name="district_code[]" value="D05" autocomplete="off" title="D05 Buona Vista / West Coast / Clementi New Town" />D05 Buona Vista / West Coast / Clementi New Town</label></li>
      <li title="D06 City Hall / Clarke Quay"><label><input type="checkbox" name="district_code[]" value="D06" autocomplete="off" title="D06 City Hall / Clarke Quay" />D06 City Hall / Clarke Quay</label></li>
      <li title="D07 Beach Road / Bugis / Rochor"><label><input type="checkbox" name="district_code[]" value="D07" autocomplete="off" title="D07 Beach Road / Bugis / Rochor" />D07 Beach Road / Bugis / Rochor</label></li>
      <li title="D08 Farrer Park / Serangoon Rd"><label><input type="checkbox" name="district_code[]" value="D08" autocomplete="off" title="D08 Farrer Park / Serangoon Rd" />D08 Farrer Park / Serangoon Rd</label></li>
      <li title="D09 Orchard / River Valley"><label><input type="checkbox" name="district_code[]" value="D09" autocomplete="off" title="D09 Orchard / River Valley" />D09 Orchard / River Valley</label></li>
      <li title="D10 Tanglin / Holland / Bukit Timah"><label><input type="checkbox" name="district_code[]" value="D10" autocomplete="off" title="D10 Tanglin / Holland / Bukit Timah" />D10 Tanglin / Holland / Bukit Timah</label></li>
      <li title="D11 Newton / Novena"><label><input type="checkbox" name="district_code[]" value="D11" autocomplete="off" title="D11 Newton / Novena" />D11 Newton / Novena</label></li>
      <li title="D12 Balestier / Toa Payoh"><label><input type="checkbox" name="district_code[]" value="D12" autocomplete="off" title="D12 Balestier / Toa Payoh" />D12 Balestier / Toa Payoh</label></li>
      <li title="D13 Macpherson / Potong Pasir"><label><input type="checkbox" name="district_code[]" value="D13" autocomplete="off" title="D13 Macpherson / Potong Pasir" />D13 Macpherson / Potong Pasir</label></li>
      <li title="D14 Eunos / Geylang / Paya Lebar"><label><input type="checkbox" name="district_code[]" value="D14" autocomplete="off" title="D14 Eunos / Geylang / Paya Lebar" />D14 Eunos / Geylang / Paya Lebar</label></li>
      <li title="D15 East Coast / Marine Parade"><label><input type="checkbox" name="district_code[]" value="D15" autocomplete="off" title="D15 East Coast / Marine Parade" />D15 East Coast / Marine Parade</label></li>
      <li title="D16 Bedok / Upper East Coast"><label><input type="checkbox" name="district_code[]" value="D16" autocomplete="off" title="D16 Bedok / Upper East Coast" />D16 Bedok / Upper East Coast</label></li>
      <li title="D17 Changi Airport / Changi Village"><label><input type="checkbox" name="district_code[]" value="D17" autocomplete="off" title="D17 Changi Airport / Changi Village" />D17 Changi Airport / Changi Village</label></li>
      <li title="D18 Pasir Ris / Tampines"><label><input type="checkbox" name="district_code[]" value="D18" autocomplete="off" title="D18 Pasir Ris / Tampines" />D18 Pasir Ris / Tampines</label></li>
      <li title="D19 Hougang / Punggol / Sengkang"><label><input type="checkbox" name="district_code[]" value="D19" autocomplete="off" title="D19 Hougang / Punggol / Sengkang" />D19 Hougang / Punggol / Sengkang</label></li>
      <li title="D20 Ang Mo Kio / Bishan / Thomson"><label><input type="checkbox" name="district_code[]" value="D20" autocomplete="off" title="D20 Ang Mo Kio / Bishan / Thomson" />D20 Ang Mo Kio / Bishan / Thomson</label></li>
      <li title="D21 Clementi Park / Upper Bukit Timah"><label><input type="checkbox" name="district_code[]" value="D21" autocomplete="off" title="D21 Clementi Park / Upper Bukit Timah" />D21 Clementi Park / Upper Bukit Timah</label></li>
      <li title="D22 Boon Lay / Jurong / Tuas"><label><input type="checkbox" name="district_code[]" value="D22" autocomplete="off" title="D22 Boon Lay / Jurong / Tuas" />D22 Boon Lay / Jurong / Tuas</label></li>
      <li title="D23 Dairy Farm / Bukit Panjang / Choa Chu Kang"><label><input type="checkbox" name="district_code[]" value="D23" autocomplete="off" title="D23 Dairy Farm / Bukit Panjang / Choa Chu Kang" />D23 Dairy Farm / Bukit Panjang / Choa Chu Kang</label></li>
      <li title="D24 Lim Chu Kang / Tengah"><label><input type="checkbox" name="district_code[]" value="D24" autocomplete="off" title="D24 Lim Chu Kang / Tengah" />D24 Lim Chu Kang / Tengah</label></li>
      <li title="D25 Admiralty / Woodlands"><label><input type="checkbox" name="district_code[]" value="D25" autocomplete="off" title="D25 Admiralty / Woodlands" />D25 Admiralty / Woodlands</label></li>
      <li title="D26 Mandai / Upper Thomson"><label><input type="checkbox" name="district_code[]" value="D26" autocomplete="off" title="D26 Mandai / Upper Thomson" />D26 Mandai / Upper Thomson</label></li>
      <li title="D27 Sembawang / Yishun"><label><input type="checkbox" name="district_code[]" value="D27" autocomplete="off" title="D27 Sembawang / Yishun" />D27 Sembawang / Yishun</label></li>
      <li title="D28 Seletar / Yio Chu Kang"><label><input type="checkbox" name="district_code[]" value="D28" autocomplete="off" title="D28 Seletar / Yio Chu Kang" />D28 Seletar / Yio Chu Kang</label></li>
    </ul>
  </div>
</div>
EOF
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
      assert_equal 2130, dct.pages

      # when one of the parameters is nil
      assert_raises ArgumentError do
        dct = RealEstate::District.new("D15", nil)
      end

      assert_raises ArgumentError do
        dct = RealEstate::District.new(nil, nil)
      end
    end

    RealEstate::HTMLBuilder.stub :pages_count, "" do
      # when cannot find pages count in html
      assert_raises RuntimeError do
        dct = RealEstate::District.new("D15", "some text")
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