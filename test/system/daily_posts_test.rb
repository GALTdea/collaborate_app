require "application_system_test_case"

class DailyPostsTest < ApplicationSystemTestCase
  setup do
    @daily_post = daily_posts(:one)
  end

  test "visiting the index" do
    visit daily_posts_url
    assert_selector "h1", text: "Daily Posts"
  end

  test "creating a Daily post" do
    visit daily_posts_url
    click_on "New Daily Post"

    check "Completed" if @daily_post.completed
    fill_in "Title", with: @daily_post.title
    fill_in "User", with: @daily_post.user_id
    click_on "Create Daily post"

    assert_text "Daily post was successfully created"
    click_on "Back"
  end

  test "updating a Daily post" do
    visit daily_posts_url
    click_on "Edit", match: :first

    check "Completed" if @daily_post.completed
    fill_in "Title", with: @daily_post.title
    fill_in "User", with: @daily_post.user_id
    click_on "Update Daily post"

    assert_text "Daily post was successfully updated"
    click_on "Back"
  end

  test "destroying a Daily post" do
    visit daily_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daily post was successfully destroyed"
  end
end
