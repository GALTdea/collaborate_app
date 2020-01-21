require 'test_helper'

class DailyPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daily_post = daily_posts(:one)
  end

  test "should get index" do
    get daily_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_daily_post_url
    assert_response :success
  end

  test "should create daily_post" do
    assert_difference('DailyPost.count') do
      post daily_posts_url, params: { daily_post: { completed: @daily_post.completed, title: @daily_post.title, user_id: @daily_post.user_id } }
    end

    assert_redirected_to daily_post_url(DailyPost.last)
  end

  test "should show daily_post" do
    get daily_post_url(@daily_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_daily_post_url(@daily_post)
    assert_response :success
  end

  test "should update daily_post" do
    patch daily_post_url(@daily_post), params: { daily_post: { completed: @daily_post.completed, title: @daily_post.title, user_id: @daily_post.user_id } }
    assert_redirected_to daily_post_url(@daily_post)
  end

  test "should destroy daily_post" do
    assert_difference('DailyPost.count', -1) do
      delete daily_post_url(@daily_post)
    end

    assert_redirected_to daily_posts_url
  end
end
