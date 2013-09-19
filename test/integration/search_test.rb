require 'test_helper'

class SearchTest < ActionDispatch::IntegrationTest

  test "search for item in the database works" do
    
    link = Link.create(:title => "Internet homepage", :url => "http://www.reddit.com")

    visit root_path
    assert_equal root_path, current_path
    fill_in 'q', :with => "homepage"
    click_button "Search"

    assert_equal search_path, current_path
    save_and_open_page

    assert has_content?(link.title)




  end
end