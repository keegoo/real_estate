require '../test_helper'

class PropertyTest < Minitest::Test
  def setup
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

  def test_initialize
    hash = {
      id: "12345",
      location: "Bedok",
      type: "condo",
      tenure: "99-years",
      href: "http://xxx.com/12345/property"
    }
    ppt = RealEstate::Property.new(hash)
    assert_equal "12345", ppt.id
    assert_equal "Bedok", ppt.location
    assert_equal "condo", ppt.type
    assert_equal "99-years", ppt.tenure
    assert_equal "http://xxx.com/12345/property", ppt.href
  end

  def test_get_property_from_html
    ppt = RealEstate::Property.get_property_from_html(@property_str1)
    assert_equal "12547831", ppt.id
    assert_equal "5a Shenton Way", ppt.location
    assert_equal "Condominium", ppt.type
    assert_equal "99", ppt.tenure
    assert_equal "/listing/12547831/for-sale-five-on-shenton-v-on-shenton-2-to-agents?ref=ls%7Cfl%7C1%7C1", ppt.href
  end
end