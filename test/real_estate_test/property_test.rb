require '../test_helper'

class PropertyTest < Minitest::Test
  def setup
    @basics_str1 =<<EOF
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

    @details_str1 =<<EOF
<div class="section-content">
  <div class="row listing-details-primary">
    <div class="col-sm-6">
      <table class="table">
        <tbody>
          <tr>
            <th>Type</th>
            <td>
              Condominium For Sale
            </td>
          </tr>
          <tr>
            <th>Size</th>
            <td>
              506 sqft
            </td>
          </tr>
          <tr>
            <th>PSF</th>
            <td>
              S$ 2,727.27 psf
            </td>
          </tr>
          <tr class="text-light-muted">
            <th>
              TOP
            </th>
            <td>
              -
            </td>
          </tr>
          <tr>
            <th class="listing-detail-id">Listing ID</th>
            <td>12547831</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="col-sm-6">
      <table class="table">
        <tbody>
          <tr>
            <th>Tenure</th>
            <td>
              99-year Leasehold
            </td>
          </tr>
          <tr class="text-light-muted">
            <th>Developer</th>
            <td>
              -
            </td>
          </tr>
          <tr>
            <th>Valuation price</th>
            <td>
              S$ 13,800,000
            </td>
          </tr>
          <tr class="text-light-muted">
            <th>Furnishing</th>
            <td>
              -
            </td>
          </tr>
          <tr class="text-light-muted">
            <th>Floor Level</th>
            <td>
              -
            </td>
          </tr>
          <tr>
            <th>Re-listed on</th>
            <td>1 week ago</td>
          </tr>
        </tbody>
      </table>
    </div>
    <a href="#show-more" class="show-more" title="Click to view the rest of the details">Read More</a>
  </div>
  <div class="listing-details-text">
    <p class="listing-title">Five on Shenton (V on Shenton) ** 2% to Agents**</p>
    2% to Agents!<br />
    <br />
    Commercial and Residential development designed by the world renowned architect, I. M. Pei, V on Shenton provides you with a luxurious and vibrant ambiance to Live, Work and Play! Enjoy the highest standards of living that would engage all your senses.<br />
    What's even more amazing is that this development is just a stone's throw away from the Raffles Place MRT station and has the Thomson MRT line right at its doorstep! With V on Shenton located at the heart of the CBD area, you would be able to enjoy a host of shopping and lifestyle amenities and a short drive to most of Singapore's landmarks and attractions.<br />
    <br />
    City living with a touch of class, everything you would wish for in a residence. Why wait? To redefine living, Call me now @ 94509938
    <a href="#show-more" class="show-more" title="Click to view the rest of the details">Read More</a>
  </div>
</div>
EOF

    @features_str1 =<<EOF
<div id="facilities" class="listing-detail-block collapse-xs">
  <h3 class="section-title">Facilities<i class="pgicon pgicon-down-open visible-xs-inline pull-right"></i><span class="title-sub-value visible-xs-inline pull-right"></span></h3>
  <div class="section-content hidden-xs">
    <h4 class="section-subtitle">Key Features</h4>
    <ul>
      <li><i class="pgicon pgicon-am-hflo"></i> High Floor</li>
      <li><i class="pgicon pgicon-am-seav"></i> Sea View</li>
    </ul>
    <h4 class="section-subtitle">Amenities</h4>
    <ul>
      <li><i class="pgicon pgicon-am-bbq"></i> Barbeque Area</li>
      <li><i class="pgicon pgicon-am-club"></i> Clubhouse</li>
    </ul>
  </div>
</div>
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

  def test_details
    page = %Q[
      <div>
        <div>#{@details_str1}</div>
        <div>#{@features_str1}</div>
      </div>
    ]
    ppt = RealEstate::Property.get_property_from_html(@basics_str1)
    RealEstate::HTMLBuilder.stub :property, page do
      ppt.details
      assert_equal "For Sale", ppt.status
      assert_equal 506, ppt.size
      assert_equal "S$", ppt.currency
      assert_equal 2727.27, ppt.unit_price
      assert_equal "psf", ppt.unit
      assert_equal "-", ppt.top
      assert_equal 99, ppt.tenure
      assert_equal "-", ppt.developer
      assert_equal 13800000, ppt.total_price
      assert_equal "-", ppt.furnish
      assert_equal "-", ppt.floor_level
      assert_equal "1 week ago", ppt.re_listed_at

      assert_equal ["High Floor", "Sea View", "Barbeque Area", "Clubhouse"], ppt.features
    end
  end

  def test_get_property_from_html
    ppt = RealEstate::Property.get_property_from_html(@basics_str1)
    assert_equal "12547831", ppt.id
    assert_equal "5a Shenton Way", ppt.location
    assert_equal "Condominium", ppt.type
    assert_equal "99", ppt.tenure
    assert_equal "/listing/12547831/for-sale-five-on-shenton-v-on-shenton-2-to-agents?ref=ls%7Cfl%7C1%7C1", ppt.href
  end

end