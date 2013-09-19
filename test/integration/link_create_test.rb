require 'test_helper'

class LinkCreateTest < ActionDispatch::IntegrationTest

  test "logged in user submits valid links" do
    
    user = User.create(:email => "#{Time.now.to_f}@example.com", :password => "password")
    visit new_user_session_path
    assert_equal '/users/sign_in', current_path

    fill_in 'user_email', :with => user.email
    fill_in 'user_password', :with => 'password'

    click_button 'Sign in'
    refute_equal '/users/sign_in', current_path

    visit new_link_path
    title = "Random Title: #{Time.now.to_f}"
    fill_in 'link_title', :with => title

    fill_in 'link_url', :with => 'http://www.scheems.com/'
    click_button 'submit'
    save_and_open_page


    link = Link.last
    
    assert_equal root_path, current_path
    assert has_content?(link.title)
  end
end