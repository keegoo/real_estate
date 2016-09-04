require '../test_helper'

class PropertyGuruTest < Minitest::Test
  def setup
    @dist_str1 =<<EOF
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
</div>
EOF

    @property_str1 =<<EOF
<li class="listing-item featured-listing  listing-id-12547831 ">
  <div class="row" itemscope itemtype="http://schema.org/Place">
    <div class="listing-img img-thumbnail">
      <a href="/listing/12547831/for-sale-five-on-shenton-v-on-shenton-2-to-agents?ref=ls%7Cfl%7C1%7C1" title="For Sale - Five on Shenton (V on Shenton) ** 2% to Agents**" class="listing-img-a">
      <span class="listing-img-highlight">Featured</span>
      <span class="listing-img-a-imgwrap lazy-bg-parent" itemscope itemtype="http://schema.org/Photograph">
      <img alt="For Sale - Five on Shenton (V on Shenton) ** 2% to Agents**" data-original="https://sg1-cdn.pgimgs.com/listing/12547831/UPHO.29660248.C200X150/Five-on-Shenton-V-on-Shenton-2-to-Agents-Boat-Quay-Raffles-Place-Marina-Singapore.jpg" class="lazy" content="https://sg1-cdn.pgimgs.com/listing/12547831/UPHO.29660248.C200X150/Five-on-Shenton-V-on-Shenton-2-to-Agents-Boat-Quay-Raffles-Place-Marina-Singapore.jpg" itemprop="thumbnailUrl" />
      </span>
      </a>
      <div class="row listing-img-footer">
        <a href="#" class="pgicon pgicon-photo" title="Photos"></a>
        <a href="#" class="pgicon pgicon-photo" title="Floorplans"></a>
        <a href="#" class="pgicon pgicon-youtube-play" title="Number of videos: "></a>
      </div>
    </div>
    <div class="listing-info">
      <h3>
        <a href="/listing/12547831/for-sale-five-on-shenton-v-on-shenton-2-to-agents?ref=ls%7Cfl%7C1%7C1" title="For Sale - Five on Shenton (V on Shenton) ** 2% to Agents**" itemprop="url">
        <span itemprop="name">Five on Shenton (V on Shenton) ** 2% to Agents**</span>
        </a>
      </h3>
      <ul class="listing-features">
        <li class="lst-details"><span class="lst-ptype">Condominium</span> <span class="lst-tenure">99-year Leasehold</span></li>
      </ul>
      <p class="listing-location"  itemscope itemtype="http://schema.org/PostalAddress"><span itemprop="streetAddress">5a Shenton Way</span></p>
      <ul class="listing-features">
        <li class="lst-sizes">506 sqft <span class="mid-sep">&middot;</span> S$&nbsp;2,727.27&nbsp;psf</li>
        <li class="lst-rooms"><span class="bed" title="1 Bed">1 <i class="pg-icon pgicon-bedroom"></i></span> <span class="bath" title="1 Bath">1 <i class="pg-icon pgicon-shower"></i></span></li>
      </ul>
    </div>
    <div class="listing-values">
      <div class="listing-values-pricing">
        <p class="listing-price">S$ 1,380,000</p>
      </div>
      <div class="btn-tools"><a href="#shownumber" class="pgicon pgicon-phone js-agent-phone-number"><span class="agent-phone-number">+65 9450 9938</span></a><a href="/listing/12547831/for-sale-five-on-shenton-v-on-shenton-2-to-agents?ref=ls%7Cfl%7C1%7C1#contact-agent" class="pgicon pgicon-comment btn-agent-contact-mail"><span class="sr-only">Message</span></a><a href="#shortlist" class="pgicon pgicon-heart btn-shortlist " data-action-del="/shortlist/delete/12547831" data-action-add="/shortlist/add/12547831" data-listing-id="12547831"><span class="hidden-xs hidden-sm hidden-md">Shortlist</span></a></div>
    </div>
  </div>
  <div class="row listing-footer">
    <div class="listing-marketed">
      Brenda Zee 徐黎倫 · 1 day ago
    </div>
  </div>
</li>
EOF
  end

  def test_district
    HTTParty.stub :get, @dist_str1 do
      assert_equal 28, RealEstate::PropertyGuru.district.size
      assert_equal "D28 Seletar / Yio Chu Kang", RealEstate::PropertyGuru.district[27][:text]
      assert_equal "D28", RealEstate::PropertyGuru.district[27][:code]
    end
  end

  def test_get_property_info
    property_node = Nokogiri::HTML(@property_str1)
    property = RealEstate::PropertyGuru.get_property_info(property_node)
    assert_equal "12547831", property[:id]
    assert_equal "Condominium", property[:type]
    assert_equal "5a Shenton Way", property[:location]
    assert_equal "99", property[:tenure]
    assert_equal "/listing/12547831/for-sale-five-on-shenton-v-on-shenton-2-to-agents?ref=ls%7Cfl%7C1%7C1", property[:href]
  end
end