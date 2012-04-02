require 'test_helper'

class TopSectionsControllerTest < ActionController::TestCase
  setup do
    @top_section = top_sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:top_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create top_section" do
    assert_difference('TopSection.count') do
      post :create, top_section: @top_section.attributes
    end

    assert_redirected_to top_section_path(assigns(:top_section))
  end

  test "should show top_section" do
    get :show, id: @top_section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @top_section
    assert_response :success
  end

  test "should update top_section" do
    put :update, id: @top_section, top_section: @top_section.attributes
    assert_redirected_to top_section_path(assigns(:top_section))
  end

  test "should destroy top_section" do
    assert_difference('TopSection.count', -1) do
      delete :destroy, id: @top_section
    end

    assert_redirected_to top_sections_path
  end
end
